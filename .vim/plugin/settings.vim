try
    " choose different colorscheme if tmux light mode is on
    call system('tmux showenv -g TMUX_LIGHT')
    if v:shell_error
        colorscheme yin
    else
        colorscheme yang
    endif
catch
endtry

let &colorcolumn="+".join(range(1,winwidth('%')),",+")
set autowrite
set backspace=indent,eol,start
set belloff=all
set completeopt=menuone,noselect,preview
set cursorline
set encoding=utf-8
set expandtab
set fillchars=vert:\ ,eob:\ ,fold:·,foldopen:┍,foldsep:│,foldclose:━
set foldcolumn=0
set foldtext=getline(v:foldstart).'\ '
set formatoptions+=j
set formatoptions-=l
set formatoptions-=o
set gdefault
set hidden
set hlsearch
set ignorecase
set incsearch
set lazyredraw
set matchpairs+=<:>
set mouse=a
set nocompatible
set nomodeline
set noruler
set noshowmode
set shiftwidth=4
set showbreak=↪\
set showcmd
set showmatch
set smartcase
set softtabstop=4
set spell
set spelllang=en_us,de_de
set splitright
set termguicolors
set textwidth=78
set thesaurus+=~/.vim/thesaurus/english.txt
set ttyfast
set wildmenu
set wildmode=list:longest
