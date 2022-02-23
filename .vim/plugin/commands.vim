" See the difference between the current buffer and the file on disk
command! Diff vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
    \ | wincmd p | diffthis

" Delete Carriage Return (Windows line breaks)
command! Dcr %s/$/

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
command! -nargs=* -bang RG call fzf#rg(<q-args>, <bang>0)

" Warp Directory integration
command! -nargs=1 Wd call wd#cd(<f-args>)

" Execute given command in shell, print to new buffer
command! -complete=shellcmd -nargs=+ Shell call inshell#exec(<q-args>)

" Add every opened file to fasd
autocmd BufReadPost * silent call system('fasd -A '.expand('%'))

" Set file type to shell script if file ends on 'rc' and no other file type
" is set
autocmd BufNewFile,BufRead *rc if (!&ft) | setl ft=zsh | endif

" Open help in vertical split
augroup VerticalHelp
  autocmd!
  autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
augroup END

" Apply overrides to often-used color schemes
augroup ColorOverride
    autocmd!
    autocmd ColorScheme yin      call DarkColorsApply()
    autocmd ColorScheme despacio call DarkColorsApply() | hi Number ctermfg=9
    autocmd ColorScheme yang     call colors_light#apply()
    autocmd ColorScheme morning  call colors_light#apply()
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

" Dir of current file
cabbrev <expr> %% expand('%:p:h')

" Two dirs up
cabbrev <expr> ... "../.."

" Save as sudo
cabbrev w!! w !sudo tee "%"

" Save and source
cabbrev ws w <Bar> so %
