if has('win32')
    let $plugDir = "~/vimfiles/plugged"
else
    let $plugDir = "~/.vim/plugged"
endif

call plug#begin($plugDir)
    " =========================== Tool integration ===========================
    " Ranger integration
    Plug 'francoiscabrol/ranger.vim'
        let g:ranger_map_keys = 0
        nnoremap <silent> <Leader>f :<C-U>Ranger<CR>
        nnoremap <silent> <Leader>F :<C-U>RangerWorkingDirectory<CR>
        " Redirect the dependency on the BClose plugin to Bbye
        " command -bang Bclose :Bwipeout
        " let g:ranger_replace_netrw = 1

    " Fuzzy file finder
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
        let g:fzf_layout = { 'window': 'enew' }
        " Due to clever-f plugin, : and , are free
        nnoremap <silent> ,            :<C-U>Buffers<CR>
        nnoremap <silent> :            :<C-U>History<CR>
        noremap  <silent> <Leader>.    :<C-U>Files<CR>
        nnoremap <silent> <Leader>`    :<C-U>Marks<CR>
        nnoremap <silent> <Leader>/    :<C-U>History/<CR>
        nnoremap <silent> <Leader>;    :<C-U>History:<CR>
        nnoremap <silent> <Leader>,    :<C-U>Helptags<CR>
        nnoremap <silent> <Leader><CR> :<C-U>Commands<CR>
        nnoremap <silent> <Leader>$    :<C-U>Snippets<CR>
        " Selecting mappings
        nmap <Leader><Tab> <Plug>(fzf-maps-n)
        xmap <Leader><Tab> <Plug>(fzf-maps-x)
        omap <Leader><Tab> <Plug>(fzf-maps-o)
        imap <C-X>m        <Plug>(fzf-maps-i)
        " Insert mode completion
        imap <C-X>k        <Plug>(fzf-complete-word)
        imap <C-X>f        <Plug>(fzf-complete-path)
        imap <C-X>j        <Plug>(fzf-complete-file-ag)
        imap <C-X>l        <Plug>(fzf-complete-line)

    " Tmux
    Plug 'christoomey/vim-tmux-navigator'

    " ======================== Improved visual feedback ======================
    " Color scheme
    Plug 'AlessandroYorba/Despacio'

    " Preview registers
    Plug 'junegunn/vim-peekaboo'

    " " Show marks on left border
    " Plug 'kshenoy/vim-signature'

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

    " Shader file highlighting
    Plug 'vim-scripts/ShaderHighLight'

    " Lines mark indentation level
    Plug 'Yggdroot/indentLine', { 'for': [ 'python', 'cs' ] }
        let g:indentLine_enabled = 0
        let g:indentLine_char_list = ['│']

    " ============================== New motions =============================
    " Camel case word motion
    Plug 'chaoren/vim-wordmotion'
        " Jump over these signs:
        let g:wordmotion_prefix = '<Leader>'
        let g:wordmotion_spaces = '_-./\(\)\[\]'

    " Vim motions on speed
    Plug 'easymotion/vim-easymotion'
        let g:EasyMotion_keys = "abcdefghijklmnopqrstuvwxyz"
        map <Space> <Plug>(easymotion-overwin-f)

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
            \   ['&&', '||'],
            \   ['and', 'or'],
            \   ['int', 'float', 'bool'],
            \   ['public', 'protected', 'private'],
            \ ]

    " Tab completion in insert mode
    Plug 'ervandew/supertab'

    " Easily align multiple lines of text
    Plug 'junegunn/vim-easy-align'
        " Interactive align for a motion/text object
        nmap <Leader>a <Plug>(EasyAlign)
        " Interactive align in visual mode
        vmap <Leader>a <Plug>(EasyAlign)

    " Close buffer without closing window
    Plug 'moll/vim-bbye'

    " Add Readline commands to insert mode
    " Plug 'tpope/vim-rsi'
    "     let g:rsi_no_meta = 1

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
        " Swap adjacent words and move cursor to their start or end
        nmap cl cxiwwcxiw
        nmap ch cxiwbcxiw
        nmap cL cxiwwcxiwb
        nmap cH cxiwbcxiww

    " ============================== Autocommands ============================
    " Automatically close brackets
    Plug 'jiangmiao/auto-pairs'
        " let g:AutoPairsMultilineClose = 0
        " let g:AutoPairsFlyMode = 1
        let g:AutoPairsShortcutToggle = '<C-X>x'
        let g:AutoPairsMapCh = ''
        let b:autopairs_enabled = 0

    " Comment text object
    Plug 'glts/vim-textobj-comment'

    " Text object for text after a character
    Plug 'junegunn/vim-after-object'
        autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ', '_', '/')

    " Sub-clause / function argument text object
    Plug 'peterrincker/vim-argumentative'

    " I and A to prepend/append to visual selection
    Plug 'kana/vim-niceblock'

    " Easily define new text objects
    Plug 'kana/vim-textobj-user'

    " Text object for last searched pattern
    Plug 'kana/vim-textobj-lastpat'

    " Text object for current line
    Plug 'kana/vim-textobj-line'

    " Text object for functions
    Plug 'kana/vim-textobj-function'

    " Indent text object
    Plug 'michaeljsmith/vim-indent-object'

    " Make plugin commands repeatable
    Plug 'tpope/vim-repeat'

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
        nmap <Leader>t <Plug>Translate
        vmap <Leader>t <Plug>TranslateV
        " Replace the text with translation
        nmap <Leader>T <Plug>TranslateR
        vmap <Leader>T <Plug>TranslateRV

        func! ToggleTargetLang()
            if g:translator_target_lang ==? 'en'
                let g:translator_target_lang = 'de'
                echo "New target lang: de"
            else
                let g:translator_target_lang = 'en'
                echo "New target lang: en"
            endif
        endfunc
        noremap <silent> <Leader>z :<C-U>call ToggleTargetLang()<CR>

    " ======================= Command line improvements ======================
    " Search for multiple variants of a word
    Plug 'tpope/vim-abolish'

    " Rename currently edited file
    Plug 'vim-scripts/Rename2' 

    " ============================== Coding ==================================
    " Switch between single and multi line forms of code
    " TODO find out if it's adding anything to Argwrap
    " Plug 'andrewradev/splitjoin.vim', { 'for': [ 'python', 'cs' ] }
    "     let g:splitjoin_trailing_comma = 1

    " Autocompletion
    Plug 'davidhalter/jedi-vim', { 'for': [ 'python' ] }

    " Linting and completion
    " let g:ale_completion_enabled = 1
    Plug 'dense-analysis/ale', { 'for': [ 'python', 'cs' ] }
        nmap gl <Plug>(ale_lint)
        nmap [k <Plug>(ale_previous_wrap)
        nmap ]k <Plug>(ale_next_wrap)
        nmap [K <Plug>(ale_first)
        nmap ]K <Plug>(ale_last)
        "set omnifunc=ale#completion#OmniFunc
        let g:ale_python_pylint_executable = 'pylint3'
        let g:ale_lint_on_text_changed = 'never'
        let g:ale_sign_error = '.'
        let g:ale_sign_warning = '.'
        let g:ale_lint_on_insert_leave = 1
        let g:ale_lint_on_save = 1
        " let g:ale_lint_on_enter = 1
        " let g:ale_set_quickfix = 1
        let g:ale_echo_msg_format = '[%linter%] %s'
        let g:ale_linters = {
            \ 'cs': [ 'OmniSharp' ]
            \ }
        let g:ale_fixers = {
            \ '*': [ 'remove_trailing_lines', 'trim_whitespace' ],
            \ 'python': [ 'autopep8', 'isort' ]
            \ }

    " Wrap and unwrap function arguments
    Plug 'foosoft/vim-argwrap', { 'for': [ 'python', 'cs' ] }
        nmap <Leader>p <Plug>(ArgWrapToggle)
        let g:argwrap_wrap_closing_brace = 0

    " Template texts to insert automatically
    Plug 'honza/vim-snippets'

    Plug 'mathijs-bakker/vim-unity-snippets', { 'for': 'cs' }
        let g:UltiSnipsSnippetDirectories=["UltiSnips", "UnitySnippets"]

    " Show 'Code Actions available' icon
    " Plug 'nickspoons/vim-sharpenup', { 'for': 'cs' }
    "     let g:sharpenup_codeactions_glyph = '*'

    " " Smart comma & semicolon insertion
    " Plug 'd4ku/cosco.vim', { 'for': ['cs', 'shaderlab'] }
    "     let g:cosco_ignore_comment_lines = 1        
    "     " let g:cosco_ignore_ft_pattern = {
    "     "   \ 'cs': '^#',
    "     "   \}

    " C# coding
    Plug 'omniSharp/omnisharp-vim', { 'for': 'cs' }

    " Visual debugging
    " let g:vimspector_enable_mappings = 'HUMAN'
    " Plug 'puremourning/vimspector', { 'for': [ 'cs' ] }

    " " Adjust indentation of pasted text
    " Plug 'sickill/vim-pasta', { 'for': [ 'cs', 'python' ] }
    "     let g:pasta_enabled_filetypes = [ 'cs', 'python' ]
    "     let g:pasta_paste_before_mapping = '[P'
    "     let g:pasta_paste_after_mapping = ']P'

    " Snippet engine
    if has('python3')
        Plug 'sirver/ultisnips'
            let g:UltiSnipsExpandTrigger="<C-S>"
            let g:UltiSnipsJumpForwardTrigger="<C-B>"
            let g:UltiSnipsJumpBackwardTrigger="<C-Z>"
    endif

    " =========================== Writing prose ==============================
    " Preview markdown in browser
    " Plug 'iamcco/markdown-preview.nvim', {
    "     \ 'do': { -> mkdp#util#install() },
    "     \ 'for': ['markdown', 'vim-plug']
    "     \ }

    " Show only small text area
    Plug 'junegunn/goyo.vim'
        nnoremap <silent> <F4> :<C-U>Goyo<CR>
        autocmd! User GoyoEnter nested Limelight
        autocmd! User GoyoLeave nested Limelight!
        
    " Highlight current paragraph
    Plug 'junegunn/limelight.vim'

    " Highlight bad word choices
    " Plug 'reedes/vim-wordy', { 'for': [ 'txt', 'markdown' ] }
call plug#end()
