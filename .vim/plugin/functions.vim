" Copy text into Windows Clipboard
func! GetSelectedText()
    normal gv"xy
    let result = getreg("x")
    return result
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
