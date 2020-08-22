" Don't auto-wrap
setlocal formatoptions-=t
" Not even comments
setlocal formatoptions-=c
setlocal textwidth=72

" Current buffer
nnoremap <buffer> <LocalLeader>x :w<CR>:exec 'Shell python3' shellescape(@%, 1)<CR>

" Argwrap plugin settings
let b:argwrap_wrap_closing_brace = 1
let b:argwrap_tail_indent_braces = '('
let b:argwrap_tail_comma = 1
