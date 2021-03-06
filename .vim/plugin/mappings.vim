" Remap semicolon to colon in normal and visual mode
noremap ; :

" Redo more intuitive
nnoremap U <C-R>
nnoremap <C-R> U

" Match y behavior to d and c
nnoremap Y y$

" " Wrapped lines goes down/up to next row, rather than next line in file.
" noremap j gj
" noremap k gk
" noremap gj j
" noremap gk k

" qq to record, Q to replay
noremap Q @q

" Use original mapping to switch window and maximize it
noremap <C-W>j <C-W>j<C-W>_
noremap <C-W>k <C-W>k<C-W>_
noremap <Leader>v :<C-U>vsplit<CR>
noremap <Leader>V :<C-U>vsplit<CR><C-W>H

" Map Alt-J and Alt-K to move view up and down
nnoremap <Esc>j 2<C-Y>
nnoremap <Esc>k 2<C-E>
nnoremap <Esc>J 10<C-Y>
nnoremap <Esc>K 10<C-E>

" Insert a single character in front or behind cursor
nnoremap cd i_<Esc>r
nnoremap cD a_<Esc>r

" Paste without newline
nnoremap zp i<CR><Esc>P"_d0kgJgJ
nnoremap zP i<CR><Esc>PkgJgJ

" Map Alt-L and Alt-H to resize vertical splits
nnoremap <Esc>l <C-W>5<
nnoremap <Esc>h <C-W>5>

" Remove blank lines before and after paragraph
nnoremap <Leader>{ {dd<C-O>
nnoremap <Leader>} }dd<C-O>

" Substitute word under cursor
nnoremap <Leader>S :%s/\<<C-R><C-W>\>/

" Move between errors and automatically pick first fix
nnoremap [S [s1z=
nnoremap ]S ]s1z=

" Fix last spell error without leaving insert mode (with undo breaks)
inoremap <C-X>z <C-G>u<Esc>[s1z=`]a<C-G>u

" Open and close stuff
" noremap <Leader>n :<C-U>tabnew<CR>
" noremap <Leader>N :<C-U>tabclose<CR>
noremap <Leader>l :<C-U>lopen<CR>
noremap <Leader>L :<C-U>lclose<CR>

" Break & join lines at textwidth w/ and wo/ + at the end of the line
nnoremap <Leader>n 76\|Bi"<CR>"<Esc>
nnoremap <Leader>N 74\|Bi" +<CR>"<Esc>
nnoremap <Leader>J JF"df"

noremap <silent> <F3> :<C-U>call ToggleLight()<CR>

autocmd FileType cs,shaderlab,hlsl
    \ inoremap <silent> <buffer> ; <C-R>=SmartSemicolon()<CR>

" Esc during completion confirms and exits insert mode
" inoremap <expr> <Esc> pumvisible() ? '<C-Y><Esc>' : '<Esc>'
