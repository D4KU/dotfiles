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

" Jedi plugin settings
let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_select_first = 0
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_stubs_command = "<leader>s"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>u"
let g:jedi#completions_command = ""
let g:jedi#rename_command = "<F2>"

" Switch.vim plugin settings
let g:switch_custom_definitions +=
    \ [
    \   ['if', 'elif'],
    \   ['is', 'is not'],
    \ ]
