set nocompatible	    " No Vi backwards compatibility
if !has('gui_running')
  set t_Co=256            " More Colors!
endif
set encoding=utf-8        " UTF-8 character encoding
set hlsearch              " Highlight search results
set smartcase             " Override 'ignore case' if search contains capitals
set incsearch             " Show matches as search pattern is typed
set noshowcmd		          " Show (partial) command in status line.
set showmatch		          " Show matching brackets.
set ignorecase		        " Do case insensitive matching
set autowrite		          " Automatically save before commands like :next and :make
set hidden		            " Hide buffers when they are abandoned
set lazyredraw            " Don't update the display while executing macros
set ttyfast               " Send more characters to screen at once
set shiftwidth=4          " Use indents of 4 spaces
set softtabstop=4         " Let backspace delete indent
set expandtab             " Tabs are spaces, not tabs
set gdefault		          " Search global by default
set spell                 " Enable spell checking
set spelllang=en_us,de_de " Spell check English and German
set matchpairs+=<:>       " Add angled brackets to % move
set splitright            " Create new panes to the right
set noshowmode            " Don't show which mode is active
set wildmenu              " Improved tab completion menu
set wildmode=list:longest " List matches and complete till longest common string
set textwidth=78          " Max line length
set formatoptions+=j      " Try to remove a comment leader when joining lines
set formatoptions-=l      " Break too long lines in insert mode
set formatoptions-=o      " Don't automatically insert comment leader on 'o'
set belloff=all           " Play no sounds
set cursorline            " Highlight current line
set nomodeline            " Don't execute modelines
set backspace=indent,eol,start " Allow backspacing over start position of insert mode
set showbreak=↪\          " Show indicator in front of wrapped lines
set foldcolumn=0          " Show one depth of folds in sign column
set foldtext=MyFoldText() " Custom function supplying text for closed folds
"set laststatus=2         " Always show statusbar
"set scrolloff=1          " Keep some lines above and below cursor during scrolling
"set timeoutlen=500       " Don't wait for character after pressing Escape
"set autoindent           " Copy indent from current line when starting a new one
"set ls=2                 " Always show status bar
"set autochdir            " Pwd is always the one the current file is in
let &colorcolumn="+".join(range(1,270),",+")

set fillchars=
  \vert:\ ,
  \eob:\ ,
  \fold:·,
  \foldopen:┍,
  \foldsep:│,
  \foldclose:─
