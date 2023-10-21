setlocal commentstring=//%s

" YouCompleteMe
call SetUpYCM()
nnoremap <buffer> <Leader>d <Cmd>YcmCompleter GoToImprecise<CR>
nnoremap <buffer> <Leader>h <Cmd>YcmCompleter GetDocImprecise<CR>
