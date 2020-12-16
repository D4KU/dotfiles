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

" Select lastly pasted text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" Alt-Backspace to forward to jump list, backspace to rewind
noremap <BS> <C-O>

" Use original mapping to switch window and maximize it
noremap <C-W>j <C-W>j<C-W>_
noremap <C-W>k <C-W>k<C-W>_
noremap <Leader>v :<C-U>vsplit<CR>
noremap <Leader>V :<C-U>vsplit<CR><C-W>H

" Map Alt-J and Alt-K to move view up and down
nnoremap <Esc>j <C-Y>
nnoremap <Esc>k <C-E>

" Insert a single character in front or behind cursor
nnoremap cd i_<Esc>r
nnoremap cD a_<Esc>r

" Paste without newline
nnoremap zp mzp^D"_ddg`zP

"Test" Map Alt-L and Alt-H to resize vertical splits
nnoremap <Esc>l <C-W>5<
nnoremap <Esc>h <C-W>5>

" Move to first and last word in paragraph
nnoremap z{ {w
nnoremap z} }ge

" Substitute word under cursor
nnoremap <Leader>S :%s/\<<C-R><C-W>\>/

" Join all non-empty lines
nnoremap <Leader>j :%s/\(\S\s*\)\n\(\s*\S\)/\1 \2<CR>

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

autocmd FileType cs,shaderlab,hlsl
    \ inoremap <silent> <buffer> ; <C-R>=SmartSemicolon()<CR>

" Esc during completion confirms and exits insert mode
" inoremap <expr> <Esc> pumvisible() ? '<C-Y><Esc>' : '<Esc>'
