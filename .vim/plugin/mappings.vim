" Redo more intuitive
nnoremap U <C-R>
nnoremap <C-R> U

" Match y behavior to d and c
nnoremap Y y$

" Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" qq to record, Q to replay
noremap Q @q

" Alt-Backspace to forward to jump list, backspace to rewind
noremap <BS> <C-O>

" Use original mapping to switch window and maximize it
noremap <C-W>j <C-W>j<C-W>_
noremap <C-W>k <C-W>k<C-W>_
noremap <Leader>v :<C-U>vsplit<CR>
noremap <Leader>V :<C-U>vsplit<CR><C-W>H

" Map Alt-J and Alt-K to move view up and down
noremap <Esc>j <C-Y>
noremap <Esc>k <C-E>

" Map Alt-L and Alt-H to resize vertical splits
noremap <Esc>l <C-W>5<
noremap <Esc>h <C-W>5>

" Fix last spell error without leaving insert mode (with undo breaks)
inoremap <Esc>s <C-G>u<Esc>[s1z=`]a<C-G>u

" Remap semicolon to colon in normal and visual mode
noremap ; :

" Open and close stuff
" noremap <Leader>n :<C-U>tabnew<CR>
" noremap <Leader>N :<C-U>tabclose<CR>
noremap <Leader>l :<C-U>lopen<CR>
noremap <Leader>L :<C-U>lclose<CR>

" In- and decrease the window size by a factor of 1.5
noremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
noremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" Copy text into Windows Clipboard
noremap <Leader>y :call system('clip.exe', GetSelectedText())<CR>
noremap <Leader>Y :call system('clip.exe', GetSelectedText())<CR>gvx

" Break strings at textwidth
nnoremap <Leader>n 72\|Bi"<CR>"<Esc>

noremap <F3> :call ToggleLight()<CR>
noremap <silent> gK :call Doc()<CR>

" Esc during completion confirms and exits insert mode
" inoremap <expr> <Esc> pumvisible() ? '<C-Y><Esc>' : '<Esc>'
