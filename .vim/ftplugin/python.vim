" Don't auto-wrap
setlocal formatoptions-=t
" Not even comments
setlocal formatoptions-=c
setlocal textwidth=72

" Execute current buffer
nnoremap <buffer> <Leader>X :w<CR>:exec 'Dispatch python' shellescape(@%, 1)<CR>

" Argwrap plugin settings
let b:argwrap_wrap_closing_brace = 1
let b:argwrap_tail_indent_braces = '('
let b:argwrap_tail_comma = 1

" YouCompleteMe
call SetUpYCM()
nnoremap <buffer> <Leader>d <Cmd>YcmCompleter GoToDeclaration<CR>
nnoremap <buffer> <Leader>h <Cmd>YcmCompleter GetDoc<CR>

" Switch.vim plugin settings
let b:switch_custom_definitions =
    \ [
    \   ['if', 'elif'],
    \   ['is', 'is not'],
    \ ]
