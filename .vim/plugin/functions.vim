" Copy text into Windows Clipboard
func! GetSelectedText()
    normal gv"xy
    let result = getreg("x")
    return result
endfunc

" Switch between light and dark color schemes
func! ToggleLight()
  if g:lightactive
    try
      colorscheme despacio
      hi Number ctermfg=9
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
        exec("normal! A;")
        call setpos('.', pos)
        return ""
    else
        return ";"
    endif
endfunction

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
function! Doc()
    if &filetype =~ "cs"
        let s:urlTemplate = "https://docs.unity3d.com/2020.2/Documentation/ScriptReference/30_search.html?q=%"
    else
        return
    endif
    let s:browser = "firefox.exe"
    let s:wordUnderCursor = expand("<cword>")
    let s:url = substitute(s:urlTemplate, "%", s:wordUnderCursor, "g")
    let s:cmd = "silent !" . s:browser . " " . s:url . "&"
    execute s:cmd
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
