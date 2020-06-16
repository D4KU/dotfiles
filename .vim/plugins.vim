silent! if plug#begin('~/.vim/plugged')
    " =========================== Tool integration ===========================
    " Ranger integration
    Plug 'francoiscabrol/ranger.vim'
        let g:ranger_map_keys = 0
        nnoremap <leader>f :<C-U>Ranger<CR>
        nnoremap <leader>F :<C-U>RangerNewTab<CR>
        nnoremap <leader>r :<C-U>RangerWorkingDirectory<CR>
        nnoremap <leader>k :<C-U>RangerWorkingDirectoryNewTab<CR>
        " Redirect the dependency on the BClose plugin to Bbye
        " command -bang Bclose :Bwipeout
        " let g:ranger_replace_netrw = 1

    " Fuzzy file finder
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
        " Due to clever-f plugin, : and , are free
        nnoremap ,            :<C-U>Buffers<CR>
        nnoremap :            :<C-U>History<CR>
        noremap  <Leader>.    :<C-U>Files<CR>
        nnoremap <Leader>`    :<C-U>Marks<CR>
        nnoremap <Leader>/    :<C-U>History/<CR>
        nnoremap <Leader>;    :<C-U>History:<CR>
        nnoremap <Leader>,    :<C-U>Helptags<CR>
        nnoremap <Leader><CR> :<C-U>Commands<CR>
        " Selecting mappings
        nmap <leader><tab>    <Plug>(fzf-maps-n)
        xmap <leader><tab>    <Plug>(fzf-maps-x)
        omap <leader><tab>    <Plug>(fzf-maps-o)
        " Insert mode completion
        imap <c-x><c-k>       <Plug>(fzf-complete-word)
        imap <c-x><c-f>       <Plug>(fzf-complete-path)
        imap <c-x><c-j>       <Plug>(fzf-complete-file-ag)
        imap <c-x><c-l>       <Plug>(fzf-complete-line)

    " Tmux
    Plug 'christoomey/vim-tmux-navigator'

    " ======================== Improved visual feedback ======================
    " Color scheme
    Plug 'AlessandroYorba/Despacio'

    " Preview registers
    Plug 'junegunn/vim-peekaboo'

    " Show marks on left border
    Plug 'kshenoy/vim-signature'

    " Highlight colors in their... color
    Plug 'lilydjwg/colorizer'
        let g:colorizer_maxlines = 500

    " Highlight words equal to the one under cursor
    Plug 'RRethy/vim-illuminate'
        let g:Illuminate_delay = 100

    " Syntax highlighting for many languages
    Plug 'sheerun/vim-polyglot'
        let g:python_highlight_all = 1

    " Improved feedback on search
    Plug 'vim-scripts/IndexedSearch'

    " Lines mark indentation level
    Plug 'Yggdroot/indentLine', { 'for': [ 'python', 'cs' ] }
    let g:indentLine_char_list = ['│']

    " ============================== New motions =============================
    " Camel case word motion
    Plug 'chaoren/vim-wordmotion'
        " Map original vim motions to meta key
        nnoremap w w
        nnoremap b b
        nnoremap e e
        nnoremap ge ge
        " Jump over these signs:
	let g:wordmotion_spaces = '_-./\(\)\[\]'

    " Vim motions on speed
    Plug 'easymotion/vim-easymotion'
        map <Leader> <Plug>(easymotion-prefix)

    " Motions based on indent depths
    Plug 'jeetsukumaran/vim-indentwise'

    " Replace ; key
    Plug 'rhysd/clever-f.vim'
        let g:clever_f_across_no_line = 1
        let g:clever_f_smart_case = 1

    " ============================= New mappings =============================
    " Switch word under cursor if it matches a pattern
    Plug 'AndrewRadev/switch.vim'
    let g:switch_custom_definitions =
        \ [
        \   ['if', 'else', 'elif'],
        \   ['and', 'or'],
        \   ['is', 'is not'],
        \   ["'", '"'],
        \ ]

    " Easily align multiple lines of text
    Plug 'junegunn/vim-easy-align'
        " Interactive align for a motion/text object
        nmap <Leader>a <Plug>(EasyAlign)
        " Interactive align in visual mode
        vmap <Leader>a <Plug>(EasyAlign)

    " Close buffer without closing window
    Plug 'moll/vim-bbye'

    " Comment text in and out
    Plug 'tpope/vim-commentary'

    " Ease session management
    Plug 'tpope/vim-obsession'

    " More mappings
    Plug 'tpope/vim-unimpaired'

    " Surround anything with anything
    Plug 'tpope/vim-surround'

    " Exchange text
    Plug 'tommcdo/vim-exchange'
        " Map Alt-L and Alt-H to exchange words
        nmap ]} cxiwwcxiw
        nmap [{ cxiwbcxiw
        nmap ]{ cxiwwcxiwb
        nmap [} cxiwbcxiww

    " Yank history navigation
    Plug 'vim-scripts/YankRing.vim'
        function! YRRunAfterMaps()
            nnoremap Y :<C-U>YRYankCount 'y$'<CR>
        endfunction

    " ============================== Autocommands ============================
    " Make plugin commands repeatable
    Plug 'tpope/vim-repeat'

    " Automatically close parenthesis
    Plug 'Townk/vim-autoclose'

    " ============================== Text objects ============================
    " Select next bigger text object
    Plug 'gcmt/wildfire.vim'

    " Comment text object
    Plug 'glts/vim-textobj-comment'

    " Text object for text after a character
    Plug 'junegunn/vim-after-object'
        autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ', '_', '/')

    " Sub-clause / function argument text object
    Plug 'peterrincker/vim-argumentative'

    " Text object for highlighted text
    Plug 'kana/vim-textobj-syntax'

    " Easily define new text objects
    Plug 'kana/vim-textobj-user'

    " Indent text object
    Plug 'michaeljsmith/vim-indent-object'

    " ============================== New gadgets =============================
    " Calculator
    Plug 'sk1418/HowMuch'

    " Translator
    Plug 'voldikss/vim-translator'
        " Translator
        let g:translator_target_lang = 'en'
        let g:translator_default_engines = ['google']
        let g:translator_window_type = 'preview'
        " Display translation in command line
        nmap <silent> <Leader>t <Plug>Translate
        vmap <silent> <Leader>t <Plug>TranslateV
        " Replace the text with translation
        nmap <silent> <Leader>T <Plug>TranslateR
        vmap <silent> <Leader>T <Plug>TranslateRV

        func! ToggleTargetLang()
            if g:translator_target_lang ==? 'en'
                let g:translator_target_lang = 'de'
                echo "New target lang: de"
            else
                let g:translator_target_lang = 'en'
                echo "New target lang: en"
            endif
        endfunc
        noremap <Leader>z :call ToggleTargetLang()<CR>

    " ======================= Command line improvements ======================
    " Search for multiple variants of a word
    Plug 'tpope/vim-abolish'

    " Rename currently edited file
    Plug 'vim-scripts/Rename2' 

    " ============================== Coding ==================================
    " Switch between single and multi line forms of code
    Plug 'andrewradev/splitjoin.vim', { 'for': [ 'python', 'cs' ] }

    " Autocompletion
    Plug 'davidhalter/jedi-vim', { 'for': [ 'python' ] }

    " Linting and completion
    " let g:ale_completion_enabled = 1
    Plug 'dense-analysis/ale', { 'for': [ 'python', 'cs' ] }
        nmap <Leader><Leader> <Plug>(ale_lint)
        "set omnifunc=ale#completion#OmniFunc
        let g:ale_python_pylint_executable = 'pylint3'
        let g:ale_lint_on_text_changed = 'never'
        let g:ale_sign_error = '!'
        let g:ale_sign_warning = '.'
        let g:ale_lint_on_insert_leave = 0
        let g:ale_lint_on_save = 0
        let g:ale_lint_on_enter = 0
        " let g:ale_set_quickfix = 1
        let g:ale_echo_msg_format = '[%linter%] %s'
        let g:ale_linters = {
            \ 'cs': ['OmniSharp']
            \ }
        let g:ale_fixers = {
            \ '*': ['remove_trailing_lines', 'trim_whitespace'],
            \ 'python': ['autopep8', 'isort']
            \ }

    " Wrap and unwrap function arguments
    Plug 'foosoft/vim-argwrap', { 'for': [ 'python' ] }
        nnoremap <silent> <leader>p :<C-U>ArgWrap<CR>
        let g:argwrap_tail_comma = 1
        let g:argwrap_tail_indent_braces = '('

    " C# coding
    Plug 'OmniSharp/omnisharp-vim', { 'for': 'cs' }

    " Visual debugging
    " let g:vimspector_enable_mappings = 'HUMAN'
    " Plug 'puremourning/vimspector', { 'for': [ 'python' ] }

    " =========================== Writing prose ==============================
    " Preview markdown in browser
    " Plug 'iamcco/markdown-preview.nvim', {
    "     \ 'do': { -> mkdp#util#install() },
    "     \ 'for': ['markdown', 'vim-plug']
    "     \ }

    " Show only small text area
    Plug 'junegunn/goyo.vim'
        nnoremap <Leader>G :<C-U>Goyo<CR>

        function! s:goyo_enter()
            Limelight
        endfunction
        function! s:goyo_leave()
            Limelight!
            " Goyo somehow unloads my highlighting
            source ~/.vim/plugin/highlight.vim
        endfunction

        autocmd! User GoyoEnter nested call <SID>goyo_enter()
        autocmd! User GoyoLeave nested call <SID>goyo_leave()
        
    " Highlight current paragraph
    Plug 'junegunn/limelight.vim'
        nnoremap <Leader>L :<C-U>Limelight!!<CR>
        xnoremap <Leader>L :<C-U>Limelight!!<CR>

    " Highlight bad word choices
    Plug 'reedes/vim-wordy', { 'for': [ 'txt', 'markdown' ] }

call plug#end()
endif
