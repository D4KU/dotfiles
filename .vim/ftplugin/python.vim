" Don't auto-wrap
setlocal formatoptions-=t
" Not even comments
setlocal formatoptions-=c
setlocal textwidth=72

" Current buffer
nnoremap <buffer> <LocalLeader>x :w<CR>:exec 'Shell python3' shellescape(@%, 1)<CR>
