let $desktop = "/mnt/c/Users/David/Desktop"

" Set cursors for different modes
if !has('win32')
    let &t_SI = "\e[6 q" " Insert mode
    let &t_SR = "\e[4 q" " Replace mode
    let &t_EI = "\e[1 q" " Normal mode
endif

" Because vim-plug isn't working when plugins.vim is under ~/.vim/plugin
runtime plugins.vim
