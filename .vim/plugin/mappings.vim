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

" Substitute word under cursor
nnoremap S :%s/\<<C-R><C-W>\>/

" Add fold column when first fold is created, remove it when all are
" deleted
nnoremap zf <Cmd>setlocal foldcolumn=2<CR>zf
nnoremap zE <Cmd>setlocal foldcolumn=0<CR>zE

nnoremap <Leader>v <Cmd>vsplit<CR>
nnoremap <Leader>V <Cmd>vsplit<CR><C-W>H

" Map Alt-J and Alt-K to move view up and down
nnoremap <Esc>j 2<C-Y>
nnoremap <Esc>k 2<C-E>
nnoremap <Esc>J 10<C-Y>
nnoremap <Esc>K 10<C-E>

" Map Alt-L and Alt-H to resize vertical splits
nnoremap <Esc>l <C-W>5<
nnoremap <Esc>h <C-W>5>

" Make cl and ch useful
nnoremap cl c2l
nnoremap ch c2h

" Paste without newline
nnoremap zP i<CR><Esc>PkgJgJ
" Paste without newline, remove indent whitespace
nnoremap zp i<CR><Esc>l"_d0P"_d0kgJgJ

nnoremap ]{ <Cmd>call search('{', 'z')<CR>
nnoremap [} <Cmd>call search('}', 'zb')<CR>

call EasymotionMaps("abcdefghijklmnopqrstuvwxyz0123456789(){}[]<>;,=&|")

" Move lines between splits
call RepeatableMap('moveRight', '<Leader>>', 'dd<C-W>lp<C-W>h', 'n')
call RepeatableMap('moveLeft' , '<Leader><', 'dd<C-W>hp<C-W>l', 'n')

" Remove blank lines before and after paragraph
call RepeatableMap('deleteBeforeParagraph', '<Leader>{', '{"_dd<C-O>', 'n')
call RepeatableMap('deleteAfterParagraph' , '<Leader>}', '}"_dd<C-O>', 'n')

" Move between errors and automatically pick first fix
call RepeatableMap('fixLastSpelling', '<Leader>[', '[s1z=', 'n')
call RepeatableMap('fixNextSpelling', '<Leader>]', ']s1z=', 'n')

" Fix last spell error without leaving insert mode (with undo breaks)
inoremap <C-X>z <C-G>u<Esc>[s1z=`]a<C-G>u

" Break & join lines at textwidth w/ and wo/ + at the end of the line
nnoremap <Leader>n 76\|Bi"<CR>"<Esc>
nnoremap <Leader>N 74\|Bi" +<CR>"<Esc>
nnoremap <Leader>J JF"df"
