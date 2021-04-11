set nocompatible	    " No Vi backwards compatibility
set t_Co=256                " More Colors!
set encoding=utf-8          " UTF-8 character encoding
set hlsearch                " Highlight search results
set smartcase               " Override 'ignore case' if search contains capitals
set incsearch               " Show matches as search pattern is typed
set showcmd		    " Show (partial) command in status line.
set showmatch		    " Show matching brackets.
set ignorecase		    " Do case insensitive matching
set autowrite		    " Automatically save before commands like :next and :make
set hidden		    " Hide buffers when they are abandoned
set lazyredraw              " Don't update the display while executing macros
" set number                  " Show number at center
" set relativenumber          " Show line numbers relative to current one
set ttyfast                 " Send more characters to screen at once
set shiftwidth=4            " Use indents of 4 spaces
set softtabstop=4           " Let backspace delete indent
set expandtab               " Tabs are spaces, not tabs
set gdefault		    " Search global by default
set spell                   " Enable spell checking
set spelllang=en_us,de_de   " Spell check English and German
set matchpairs+=<:>         " Add angled brackets to % move
set splitright              " Create new panes to the right
set noshowmode              " Don't show which mode is active
set wildmenu                " Improved tab completion menu
set wildmode=list:longest   " List matches and complete till longest common string
set textwidth=78            " Max line length
set foldcolumn:0            " Don't show column indicating folds
set fillchars+=vert:\       " Set characters in vertical split bar to spaces
set formatoptions+=j        " Try to remove a comment leader when joining lines
set formatoptions-=l        " Break too long lines in insert mode
set formatoptions-=o        " Don't automatically insert comment leader on 'o'
set belloff=all             " Play no sounds
set cursorline              " Highlight current line
set backspace=indent,eol,start " Allow backspacing over start position of insert mode
"set scrolloff=1            " Keep some lines above and below cursor during scrolling
"set timeoutlen=500         " Don't wait for character after pressing Escape
"set autoindent             " Copy indent from current line when starting a new one
"set ls=2                   " Always show status bar
"set autochdir              " Pwd is always the one the current file is in
let &colorcolumn="+".join(range(1,270),",+")

set statusline=%f\          " File name and space
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, " File encoding
set statusline+=%{&ff}]     " File format
set statusline+=%h          " Help file flag
set statusline+=%m          " Modified flag
set statusline+=%r          " Read only flag
set statusline+=%y          " File type
set statusline+=%=          " Left/right separator
set statusline+=%c\         " Cursor column
set statusline+=%l/%L       " Cursor line/total lines
set statusline+=\ %P        " Percent through file
