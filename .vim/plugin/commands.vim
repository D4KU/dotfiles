" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Revert with: ":delcommand DiffOrig".
command! DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
    \ | wincmd p | diffthis

" Delete trailing white space
command! DelTrailWS %s/\s\+$//e

" Delete Windows line breaks
command! DelWinLB %s/$/

" Go to last file if invoked without arguments.
" autocmd VimEnter * nested if
"   \ argc() == 0 &&
"   \ bufname("%") == "" &&
"   \ bufname(2) != "" |
"   \   exe "normal! `0"|
"   \ endif

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid, when inside an event handler
" (happens when dropping a file on gvim) and for a commit message (it's
" likely a different one than last time).
autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    \ |   exe "normal! g`\""
    \ | endif

" Dir of current file
cabbrev <expr> %% expand('%:p:h')

" Save as sudo
cabbrev w!! w !sudo tee "%"

" Save and source
cabbrev ws w <bar> so %
