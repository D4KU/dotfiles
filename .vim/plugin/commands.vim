" See the difference between the current buffer and the file on disk
command! Diff vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
    \ | wincmd p | diffthis

" Delete Carriage Return (Windows line breaks)
command! Dcr e ++ff=unix | %s/$/

" Pretty-print python
command! PrettyPy %!python -m json.tool

" Join all non-empty lines
command! Join %s/\(\S\s*\)\n\(\s*\S\)/\1 \2

" Fasd support
command! Fasd call fzf#run(fzf#wrap({
      \ 'source': 'fasd -al',
      \ 'options': '--no-sort --tac --tiebreak=index'}))
command! -nargs=? Z call fasd#z(<q-args>)
command! -nargs=? V call fasd#v(<q-args>)

" Slower but interactive version of fzf.vim's :Rg command
" command! -nargs=* -bang RG call fzf#rg(<q-args>, <bang>0)

" Substitute x, y, or z in variable name with given string
command! -nargs=1 Xs call setline('.', substitute(getline('.'), '\c\<[xyz]\|[xyz]\>', <f-args>, 'g'))

" Insert line number
command! -nargs=* -range Ln call feedkeys(":<line1>,<line2>s/<args>/\\=printf('%04d',
        \ line('.'))<C-Left><Left><Left><left><Left><Left><Left><Left>", 'n')

" Add every opened file to fasd
autocmd BufReadPost * silent call system('fasd -A '.expand('%'))

" Open help and preview in vertical split
augroup VerticalScratch
  autocmd!
  autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
  " autocmd BufEnter * if &previewwindow | wincmd L | endif
augroup END

" Apply overrides to often-used color schemes
augroup ColorOverride
    autocmd!
    autocmd ColorScheme yin      call DarkColorsApply()
    autocmd ColorScheme despacio call DarkColorsApply() | hi Number ctermfg=9
    autocmd ColorScheme yang     call LightColorsApply()
    autocmd ColorScheme morning  call LightColorsApply()
    autocmd ColorScheme *        call AnyColorsApply()
augroup END

" Disable things in large files
augroup LargeFile
    autocmd!
    autocmd BufWinEnter * call LargeFile(expand("<afile>"))
augroup END

" Go to last file if invoked without arguments.
" autocmd VimEnter * nested if
"   \ argc() == 0 &&
"   \ bufname("%") == "" &&
"   \ bufname(2) != "" |
"   \   exe "normal! `0"|
"   \ endif

" Full path and dir of current file
cnoreabbrev <expr> %% expand('%:p')
cnoreabbrev <expr> %^ expand('%:p:h')

" Two dirs up
cnoreabbrev <expr> ... "../.."

" Save as sudo
cnoreabbrev w!! w !sudo tee "%"

" Save and source
cnoreabbrev ws w <Bar> source %
