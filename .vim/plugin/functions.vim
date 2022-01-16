" Switch between light and dark color schemes
func! ToggleLight()
    if g:lightactive
        try
            colorscheme yin
        catch
            colorscheme delek
        endtry
        colorscheme daku_dark
        let g:lightactive = 0
    else
        colorscheme morning
        colorscheme daku_light
        let g:lightactive = 1
    endif
endfunc
let g:lightactive = 1
call ToggleLight()

" Returns if cursor is in a commented section
function! CursorInComment()
    let hg = join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'))
    return hg =~? 'comment' ? 1 : 0
endfunction

" Insert semicolon at the line's end under certain conditions
" Return the string to insert at the cursor position
function! SmartSemicolon()
    let pos = getpos('.')
    let curLineNum = pos[1]
    let nextLineNum = curLineNum + 1
    let curLine = getline(curLineNum)
    let nextLine = getline(nextLineNum)
    let curLineInd = indent(curLineNum)
    let nextLineInd = indent(nextLineNum)
    let nextLineEmpty = nextLine =~ '^\s*$'

    if !CursorInComment()
                \ && pos[2] < col('$')
                \ && curLine =~ '[a-zA-Z0-9_)\]''"]\%[\(++\)]\%[\(--\)]\s*$'
                \ && nextLine !~ '{$'
                \ && (curLineInd >= nextLineInd || nextLineEmpty)
                \ && curLine !~ '^\s*for\s\?('
        try
            " Insert semicolon at the lines' end
            exec("normal! A;")
        catch
            " If insert mode can't be left, insert semicolon at
            " end without restoring original cursor position
            return "\<End>;"
        endtry
        " Restore original cursor position
        call setpos('.', pos)
        return ""
    endif
    return ";"
endfunction

" Get syntax group under cursor
function! SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Undo all changes on current line
function! Undoline()
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
function! Doc(url)
    let l:url = substitute(a:url, "%", expand("<cword>"), "g")
    execute "silent !$BROWSER " . l:url . "&"
    execute "redraw!"
endfunction

" Print output in split instead of shell escape
function! s:ExecuteInShell(command)
    let command = join(map(split(a:command), 'expand(v:val)'))
    let winnr = bufwinnr('^' . command . '$')
    silent! execute  winnr < 0 ? 'botright new ' . fnameescape(command) : winnr . 'wincmd w'
    setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap number
    echo 'Execute ' . command . '...'
    silent! execute 'silent %!'. command
    " silent! execute 'resize ' . line('$')
    silent! redraw
    silent! execute 'au BufUnload <buffer> execute bufwinnr(' . bufnr('#') . ') . ''wincmd w'''
    silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . command . ''')<CR>'
    echo 'Shell command ' . command . ' executed.'
endfunction
command! -complete=shellcmd -nargs=+ Shell call s:ExecuteInShell(<q-args>)

" Add opened file to fasd
" jobstart not found!?
" function! s:fasd_update() abort
"   if empty(&buftype) || &filetype ==# 'dirvish'
"      call jobstart(['fasd', '-A', expand('%:p')])
"   endif
" endfunction

" Open best Fasd file match if arg passed, open FZF if not
function! FasdV(str)
    if a:str == ""
        call fzf#run({'source': 'fasd -flR', 'sink': 'e'})
    else
        let cmd = 'fasd -f1 ' . a:str
        execute 'e ' . system(cmd)
    endif
endfunction

" Change to best Fasd directory match if arg passed, open FZF if not
function! FasdZ(str)
    if a:str == ""
        call fzf#run({'source': 'fasd -dlR', 'sink': 'cd'})
    else
        let cmd = 'fasd -d1 ' . a:str
        execute 'e ' . system(cmd)
    endif
endfunction

" Slower but interactive version of fzf.vim's :Rg command
function! RgFzf(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

" Warp directory integration
function! s:Wd(pt)
    let l:cmd = "$ZPFX/../plugins/mfaerevaag---wd/wd.sh path " . a:pt
    let l:path = trim(system(l:cmd))
    if isdirectory(l:path)
        silent execute 'cd ' . l:path
        echo l:path
    else
        echo "Not a warp point"
    endif
endfunction
command! -nargs=1 Wd call s:Wd(<f-args>)

" Custom function linked to &foldtext
function! MyFoldText()
    " let num = v:foldend - v:foldstart + 1
    " let txt = substitute(getline(v:foldstart),"^ *","",1)
    " let char = matchstr(&fillchars, 'fold:\zs.')
    return getline(v:foldstart) . ' '
endfunction

" Create mapping that is repeatable
function! RepeatableMap(name, lhs, rhs, mode)
    " make <Plug>name map to rhs
    execute a:mode . 'noremap <silent> <Plug>' . a:name . ' ' . a:rhs .
        \ ' :call repeat#set("\<Plug>' . a:name . '", v:count)<CR>'

    " make lhs map to <Plug>name
    execute a:mode . 'map ' . a:lhs . ' <Plug>' . a:name
endfunction

function! Synonyms(word)
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

" Set fzf.vim preview window postion dependent on window aspect ratio
function! SmartFzfPreview()
    let l:ratio = winwidth('%') / (1.0 * winheight('%'))
    let l:side = l:ratio > 2 ? 'right' : 'up'
    let g:fzf_preview_window = [l:side . ':50%', 'ctrl-/']
endfunction
