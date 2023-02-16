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
