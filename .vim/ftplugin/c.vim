if has("cscope")
    set cscoperelative
    set cscopequickfix=s-,c-,d-,i-,t-,e-,a-

    " from :help cscope-suggestions
    nnoremap <Leader>@s <Cmd>lcscope find s <cword><CR>
    nnoremap <Leader>@g <Cmd>lcscope find g <cword><CR>
    nnoremap <Leader>@c <Cmd>lcscope find c <cword><CR>
    nnoremap <Leader>@t <Cmd>lcscope find t <cword><CR>
    nnoremap <Leader>@e <Cmd>lcscope find e <cword><CR>
    nnoremap <Leader>@f <Cmd>lcscope find f <cfile><CR>
    nnoremap <Leader>@i <Cmd>lcscope find i <cfile><CR>
    nnoremap <Leader>@d <Cmd>lcscope find d <cword><CR>
    nnoremap <Leader>@a <Cmd>lcscope find a <cword><CR>
endif
