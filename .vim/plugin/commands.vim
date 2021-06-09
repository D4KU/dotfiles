" See the difference between the current buffer and the file it was loaded
" from, thus the changes you made.
command! DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
    \ | wincmd p | diffthis

" Delete Windows line breaks
command! DelWinLB %s/$/

" Go to last file if invoked without arguments.
" autocmd VimEnter * nested if
"   \ argc() == 0 &&
"   \ bufname("%") == "" &&
"   \ bufname(2) != "" |
"   \   exe "normal! `0"|
"   \ endif

" Add every opened file to fasd
autocmd BufReadPost * silent call system('fasd -A '.expand('%'))

" Set filetype to shell script if file ends on 'rc' and no other filetype is
" set
autocmd BufNewFile,BufRead *rc if (!&ft) | setl ft=sh | endif

" Dir of current file
cabbrev <expr> %% expand('%:p:h')

" Save as sudo
cabbrev w!! w !sudo tee "%"

" Save and source
cabbrev ws w <bar> so %

" Fasd support
command! Fasd call fzf#run(fzf#wrap({'source': 'fasd -al', 'options': '--no-sort --tac --tiebreak=index'}))
command! -nargs=? Z call FasdZ(<q-args>)
command! -nargs=? V call FasdV(<q-args>)

" Slower but interactive version of fzf.vim's :Rg command
command! -nargs=* -bang RG call RgFzf(<q-args>, <bang>0)

" Join all non-empty lines
command! Join %s/\(\S\s*\)\n\(\s*\S\)/\1 \2
