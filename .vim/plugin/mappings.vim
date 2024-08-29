" Remap semicolon to colon in normal and visual mode
nnoremap ; :

" Redo more intuitive
nnoremap U <C-R>
nnoremap <C-R> U

" Match y behavior to d and c
nnoremap Y y$

" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" qq to record, Q to replay
nnoremap Q @q

" Substitute word under cursor
nnoremap S :%s/\<<C-R><C-W>\>/

" Add fold column when first fold is created, remove it when all are
" deleted
nnoremap zf <Cmd>setlocal foldcolumn=2<CR>zf
nnoremap zE <Cmd>setlocal foldcolumn=0<CR>zE

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
nnoremap dl d2l
nnoremap dh d2h

" Paste without newline
nnoremap <Leader>V i<CR><Esc>PkgJgJ
" Paste without newline, remove indent whitespace
nnoremap <Leader>v i<CR><Esc>l"_d0P"_d0kgJgJ

" Go to next brace
nnoremap ]{ <Cmd>call search('{', 'z')<CR>
nnoremap [} <Cmd>call search('}', 'zb')<CR>

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
