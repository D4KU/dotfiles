" Add ranger as a file chooser in vim
" Once you select one or more files, press enter and ranger will quit again
" and vim will open the selected files.
" Compatible with ranger 1.4.2 through 1.7.*
"func! Ranger()
"    let temp = tempname()
"    " The option "--choosefiles" was added in ranger 1.5.1. Use the next line
"    " with ranger 1.4.2 through 1.5.0 instead.
"    "exec 'silent !ranger --choosefile=' . shellescape(temp)
"    if has("gui_running")
"        exec 'silent !xterm -e ranger --choosefiles=' . shellescape(temp)
"    else
"        exec 'silent !ranger --choosefiles=' . shellescape(temp)
"    endif
"    if !filereadable(temp)
"        redraw!
"        " Nothing to read.
"        return
"    endif
"    let names = readfile(temp)
"    if empty(names)
"        redraw!
"        " Nothing to open.
"        return
"    endif
"    " Edit the first item.
"    exec 'edit ' . fnameescape(names[0])
"    " Add any remaning items to the arg list/buffer list.
"    for name in names[1:]
"        exec 'argadd ' . fnameescape(name)
"    endfor
"    redraw!
"endfunction

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
