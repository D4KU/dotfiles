" Remap semicolon to colon in normal and visual mode
noremap ; :

" Redo more intuitive
noremap U <C-R>
noremap <C-R> U

" Match y behavior to d and c
noremap Y y$

" " Wrapped lines goes down/up to next row, rather than next line in file.
" noremap j gj
" noremap k gk
" noremap gj j
" noremap gk k

" qq to record, Q to replay
noremap Q @q

" Use original mapping to switch window and maximize it
noremap <Leader>v <Cmd>vsplit<CR>
noremap <Leader>V <Cmd>vsplit<CR><C-W>H

" Open and close stuff
noremap <Leader>l <Cmd>lopen<CR>
noremap <Leader>L <Cmd>lclose<CR>

" Map Alt-J and Alt-K to move view up and down
noremap <Esc>j 2<C-Y>
noremap <Esc>k 2<C-E>
noremap <Esc>J 10<C-Y>
noremap <Esc>K 10<C-E>

" Map Alt-L and Alt-H to resize vertical splits
noremap <Esc>l <C-W>5<
noremap <Esc>h <C-W>5>

" Add fold column when first fold is created, remove it when all are
" deleted
noremap zf <Cmd>setlocal foldcolumn=2<CR>zf
noremap zE <Cmd>setlocal foldcolumn=0<CR>zE

" Insert a single character in front or behind cursor
nnoremap cd i_<Esc>r
nnoremap cD a_<Esc>r

" Paste without newline
nnoremap zP i<CR><Esc>PkgJgJ
" Paste without newline, remove indent whitespace
nnoremap zp i<CR><Esc>l"_d0P"_d0kgJgJ

" Move lines between splits
call RepeatableMap('moveRight', '<Leader>>', 'dd<C-W>lp<C-W>h', 'n')
call RepeatableMap('moveLeft' , '<Leader><', 'dd<C-W>hp<C-W>l', 'n')

" Remove blank lines before and after paragraph
call RepeatableMap('deleteBeforeParagraph', '<Leader>{', '{"_dd<C-O>', 'n')
call RepeatableMap('deleteAfterParagraph' , '<Leader>}', '}"_dd<C-O>', 'n')

" " Move between errors and automatically pick first fix
call RepeatableMap('fixLastSpelling', '<Leader>[', '[s1z=', 'n')
call RepeatableMap('fixNextSpelling', '<Leader>]', ']s1z=', 'n')

" Fix last spell error without leaving insert mode (with undo breaks)
inoremap <C-X>z <C-G>u<Esc>[s1z=`]a<C-G>u

" Break & join lines at textwidth w/ and wo/ + at the end of the line
nnoremap <Leader>n 76\|Bi"<CR>"<Esc>
nnoremap <Leader>N 74\|Bi" +<CR>"<Esc>
nnoremap <Leader>J JF"df"

nnoremap <silent> <F3> <Cmd>call ToggleLight()<CR>

autocmd FileType cs,shaderlab,hlsl
    \ inoremap <silent> <buffer> ; <C-R>=SmartSemicolon()<CR>

" Esc during completion confirms and exits insert mode
" inoremap <expr> <Esc> pumvisible() ? '<C-Y><Esc>' : '<Esc>'
