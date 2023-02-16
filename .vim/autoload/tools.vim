" Get syntax group under cursor
function! tools#synstack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Undo all changes on current line
function! tools#undoline()
    let pos = getpos(".")
    let current = getline(pos[1])
    let chg = changenr()
    while changenr() > 0 && current ==# getline(pos[1])
        silent exec 'u'
    endwhile
    let old = getline(pos[1])

    while changenr() < chg
        silent exec 'redo'
    endwhile
    " undo if we jumped over a gap
    if changenr() > chg
        silent exec 'u'
    endif
    call setpos('.', pos)
    if old ==# current
        echo 'no change found'
    else
        call setline(pos[1], old)
    endif
endfunction

" Online documentation search
function! tools#doc(url)
    let l:url = substitute(a:url, "%", expand("<cword>"), "g")
    execute "silent !$BROWSER " . l:url . "&"
    execute "redraw!"
endfunction

function! tools#synonyms(word)
    " 1. Grep thesaurus file with entire word.
    "    Word boundaries \b don't allow the word to be part of another.
    let l:grep = "grep -P '\\b" . a:word . "\\b' " . &thesaurus

    " 2. (tr)anslate spaces into newlines
    " 3. Let awk
    "   a. Filter unique lines without having to sort (up until '&&')
    "   b. Remove input word from list (after '&&')
    let l:post_proc = " | tr ' ' '\n' | awk '!x[$0]++ && !/" . a:word . "/'"
    return l:grep . l:post_proc
endfunction

function! s:Or(...)
    return join(map(copy(a:000), '"%(" .. v:val .. ")"'), '|')
endfunction

" Swap WORDS adjacent to entered word
function! tools#swapAroundWord(word)
    let l:paren = '\(.{-}\)'
    let l:brack = '\[.{-1,}\]'
    let l:quot = "'.{-}'"
    let l:dquot = '".{-}"'
    let l:float = '-?\d*\.\d+f?'
    let l:int = '-?%(\d+_)*\d+%(u|l)?'
    let l:iden = '\h\w*'
    let l:chain = l:iden . '%(' . s:Or('\.' . l:iden, l:paren, l:brack) . ')*'

    let l:mX = '(' . s:Or(l:chain, l:float, l:int, l:paren, l:quot, l:dquot) . ')'
    let l:m1 = '\v(.{-}\(?)'
    let l:m3 = '(\s*\V' . a:word . '\v\s*)'
    let l:m5 = '(.*)'
    let l:m = matchlist(getline('.'), l:m1 . l:mX . l:m3 . l:mX . l:m5)
    if len(l:m) > 5
        call setline('.', l:m[1] . l:m[4] . l:m[3] . l:m[2] . l:m[5])
    endif
endfunction

" Create vertical split only if there are no windows to left or right to reuse
function! tools#recycleVSplit()
    if winnr() != winnr('l')
        execute winnr('l') . 'wincmd q'
        vsplit
    elseif winnr() != winnr('h')
        execute winnr('h') . 'wincmd q'
        topleft vsplit
    else
        vsplit
    endif
endfunction
