" Space in normal mode inserts an empty line above
nnoremap <Space> Oa<C-U><Esc>j

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

" CTRL-I already equals <Tab>, so make CTRL-O equal <Shift-Tab>
" to use jump list more effectively
nnoremap <S-Tab> <C-O>
nnoremap <BS> <C-O>

" Use original mapping to switch window and maximize it
noremap <C-W>j <C-W>j<C-W>_
noremap <C-W>k <C-W>k<C-W>_
nnoremap <Leader>v :<C-U>vsplit<CR>
nnoremap <Leader>V :<C-U>vsplit<CR><C-W>H

" Map Alt-J and Alt-K to move view up and down
nnoremap j <C-Y>
nnoremap k <C-E>

" Map Alt-L and Alt-H to resize vertical splits
nnoremap l <C-W>5<
nnoremap h <C-W>5>

" Move without leaving insert mode
inoremap l <Esc>la
inoremap h <Esc>i

" Fix last spell error without leaving insert mode (with undo breaks)
inoremap s <C-G>u<Esc>[s1z=`]a<C-G>u

" Remap semicolon to colon in normal and visual mode
nnoremap ; :
vnoremap ; :

" Open and close stuff
noremap <Leader>n :<C-U>tabnew<CR>
noremap <Leader>N :<C-U>tabclose<CR>
noremap <Leader>l :<C-U>lopen<CR>
noremap <Leader>L :<C-U>lclose<CR>

" In- and decrease the window size by a factor of 1.5
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" Copy text into Windows Clipboard
noremap <Leader>y :call system('clip.exe', GetSelectedText())<CR>
noremap <Leader>Y :call system('clip.exe', GetSelectedText())<CR>gvx

" Break strings at textwidth
nnoremap <Leader>s 72\|Bi"<CR>"<Esc>
" :execute 'nnoremap <F3> ' . &textwidth . '\|Bi"<CR>"<Esc>'

nnoremap <F2> :call ToggleLight()<CR>
