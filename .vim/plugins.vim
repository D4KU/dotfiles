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
        noremap  <silent> <Leader>-    :<C-U>Lines<CR>
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
        imap <C-X>k <Plug>(fzf-complete-word)
        imap <C-X>f <Plug>(fzf-complete-path)
        imap <C-X>j <Plug>(fzf-complete-file)
        imap <C-X>l <Plug>(fzf-complete-buffer-line)
        imap <C-X>L <Plug>(fzf-complete-line)

    " Tmux
    Plug 'christoomey/vim-tmux-navigator'

    " ======================== Improved visual feedback ======================
    " Color scheme
    Plug 'AlessandroYorba/Despacio'

    " Status line style
    Plug 'itchyny/lightline.vim'
        let g:lightline = { 'colorscheme': 'daku' }
        let g:lightline.active = {
            \ 'left': [['paste'], ['filename'], ['modified', 'readonly', 'filetype']],
            \ 'right': [],
            \ }
        let g:lightline.inactive = {
            \ 'left': [['filename'], ['modified']],
            \ 'right': [],
            \ }
        let g:lightline.component = {
            \ 'position': '%c %l/%L'
            \ }
		let g:lightline.enable = { 'statusline': 1 }

    " Preview registers
    Plug 'junegunn/vim-peekaboo'

    " " Show marks on left border
    " Plug 'kshenoy/vim-signature'

    " Highlight colors in their... color
    Plug 'lilydjwg/colorizer'
        let g:colorizer_maxlines = 500

    " Highlight trailing whitespace
    Plug 'ntpeters/vim-better-whitespace'
        nnoremap <silent> ]w :<C-U>NextTrailingWhitespace<CR>
        nnoremap <silent> [w :<C-U>PrevTrailingWhitespace<CR>

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

    " Keep showing outer blocks around cursor
    Plug 'wellle/context.vim'
        let g:context_border_char = ' '
        let g:context_highlight_tag = '<hide>'

    " Lines mark indentation level
    Plug 'Yggdroot/indentLine'
        let g:indentLine_enabled = 0
        let g:indentLine_char_list = ['¦']
        let g:indentLine_concealcursor = ''
        let g:indentLine_faster = 1
        noremap <silent> <Leader><Bar> :<C-U>IndentLinesToggle<CR>

    " ============================== New motions =============================
    " Camel case word motion
    Plug 'chaoren/vim-wordmotion'
        " Jump over these signs:
        let g:wordmotion_prefix = '<Leader>'
        let g:wordmotion_spaces = '_-./\(\)\[\]'

    " Vim motions on speed
    Plug 'easymotion/vim-easymotion'
        let g:EasyMotion_keys = "abcdefghijklmnopqrstuvwxyz"
        map <Bslash> <Plug>(easymotion-overwin-f)

    " Motions based on indent depths
    Plug 'jeetsukumaran/vim-indentwise'
        map [<Bar> <Plug>(IndentWiseBlockScopeBoundaryBegin)
        map ]<Bar> <Plug>(IndentWiseBlockScopeBoundaryEnd)

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
        nmap <Leader>a <Plug>(LiveEasyAlign)
        " Interactive align in visual mode
        vmap <Leader>a <Plug>(LiveEasyAlign)

    " Quickly create tag hierarchies
    " Plug 'mattn/emmet-vim'

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

    " Completion for text in adjacent tmux panes
    Plug 'wellle/tmux-complete.vim'

    " Resize split to selection
    Plug 'wellle/visual-split.vim'

    " ============================== Autocommands ============================
    " Jump between pairs
    Plug 'andymass/vim-matchup'

    " Search for selection
    Plug 'bronson/vim-visual-star-search'

    " Word column text object
    Plug 'coderifous/textobj-word-column.vim'

    " Automatically close brackets
    " Plug 'jiangmiao/auto-pairs'
        " let g:AutoPairsMultilineClose = 0
        " let g:AutoPairsFlyMode = 1
        " let b:autopairs_enabled = 0
        " let g:AutoPairsCenterLine = 0
        " let g:AutoPairsShortcutToggle = '<C-X>x'
        " let g:AutoPairsMapCh = ''

    " Open file at last position
    Plug 'farmergreg/vim-lastplace'

    " Comment text object
    Plug 'glts/vim-textobj-comment'
        let g:textobj_comment_no_default_key_mappings = 1
        xmap ax <Plug>(textobj-comment-a)
        omap ax <Plug>(textobj-comment-a)
        xmap ix <Plug>(textobj-comment-i)
        omap ix <Plug>(textobj-comment-i)
        xmap Ax <Plug>(textobj-comment-big-a)
        omap Ax <Plug>(textobj-comment-big-a)

    " Function text object
    Plug 'jamesl33/vim-textobj-function'

    " Text object for text after a character
    Plug 'junegunn/vim-after-object'
        autocmd VimEnter * call after_object#enable(
            \ ['P', 'p'],
            \ '=', ':', '-', '#', ' ', '_', '/')

    " Sub-clause / function argument text object
    Plug 'peterrincker/vim-argumentative'

    " Copy text to windows clipboard
    Plug 'kana/vim-fakeclip'

    " I and A to prepend/append to visual selection
    Plug 'kana/vim-niceblock'

    " Easily define new text objects
    Plug 'kana/vim-textobj-user'

    " Text object for last searched pattern
    Plug 'kana/vim-textobj-lastpat'

    " Indent text object
    Plug 'michaeljsmith/vim-indent-object'

    " Automatically adjust shiftwidth to current document
    Plug 'roryokane/detectindent'
        augroup DetectIndent
           autocmd! BufReadPost * DetectIndent
        augroup END
    " might be better in the future:
    " Plug 'tpope/vim-sleuth'

    " Make plugin commands repeatable
    Plug 'tpope/vim-repeat'

    " Automatically close pairs
    Plug 'tmsvg/pear-tree'
        let g:pear_tree_smart_openers = 1
        let g:pear_tree_smart_closers = 1
        let g:pear_tree_smart_backspace = 1

    " Many more text objects
    Plug 'wellle/targets.vim'
        let g:targets_nl = 'nN'

    " Line text object
    Plug 'wellle/line-targets.vim'

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
    " Show and edit git hunks
    Plug 'airblade/vim-gitgutter'
        let g:gitgutter_map_keys = 0
        nmap ]h  <Plug>(GitGutterNextHunk)
        nmap [h  <Plug>(GitGutterPrevHunk)
        nmap ghs <Plug>(GitGutterStageHunk)
        nmap ghu <Plug>(GitGutterUndoHunk)
        nmap ghp <Plug>(GitGutterPreviewHunk)
        omap ih  <Plug>(GitGutterTextObjectInnerPending)
        omap ah  <Plug>(GitGutterTextObjectOuterPending)
        xmap ih  <Plug>(GitGutterTextObjectInnerVisual)
        xmap ah  <Plug>(GitGutterTextObjectOuterVisual)

    " Switch between single and multi line forms of code
    " Plug 'andrewradev/splitjoin.vim', { 'for': [ 'python', 'cs' ] }
    "     let g:splitjoin_trailing_comma = 1

    " Autocompletion
    Plug 'davidhalter/jedi-vim', { 'for': [ 'python' ] }

    " Linting and completion
    " let g:ale_completion_enabled = 1
    Plug 'dense-analysis/ale', { 'for': [ 'python', 'cs' ] }
        nmap gl <Plug>(ale_lint)
        nmap gL <Plug>(ale_fix)
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
    Plug 'foosoft/vim-argwrap'
        nmap <Leader>p <Plug>(ArgWrapToggle)
        let g:argwrap_wrap_closing_brace = 0

    " Template texts to insert automatically
    Plug 'honza/vim-snippets'

    Plug 'mathijs-bakker/vim-unity-snippets', { 'for': 'cs' }
        let g:UltiSnipsSnippetDirectories=['UltiSnips', 'UnitySnippets']

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
    " Plug 'puremourning/vimspector', { 'for': [ 'cs' ] }
    "     let g:vimspector_enable_mappings = 'VISUAL_STUDIO'

    " " Adjust indentation of pasted text
    " Plug 'sickill/vim-pasta', { 'for': [ 'cs', 'python' ] }
    "     let g:pasta_enabled_filetypes = [ 'cs', 'python' ]
    "     let g:pasta_paste_before_mapping = '[P'
    "     let g:pasta_paste_after_mapping = ']P'

    " Snippet engine
    if has('python3')
        Plug 'sirver/ultisnips'
            let g:UltiSnipsExpandTrigger='<C-S>'
            let g:UltiSnipsJumpForwardTrigger=g:UltiSnipsExpandTrigger
            let g:UltiSnipsJumpBackwardTrigger='<C-Z>'
    endif

    " Makes vim a better merge tool for git
    Plug 'samoshkin/vim-mergetool'
        let g:mergetool_layout = 'mr'
        let g:mergetool_prefer_revision = 'local'
        nmap <expr> <Left>  &diff? '<Plug>(MergetoolDiffExchangeLeft)'  : '<Left>'
        nmap <expr> <Right> &diff? '<Plug>(MergetoolDiffExchangeRight)' : '<Right>'
        nmap <expr> <Up>    &diff? '[czz' : '<Up>'
        nmap <expr> <Down>  &diff? ']czz' : '<Down>'

    " =========================== Writing prose ==============================
    " Preview markdown in browser
    " Plug 'iamcco/markdown-preview.nvim', {
    "     \ 'do': { -> mkdp#util#install() },
    "     \ 'for': ['markdown', 'vim-plug']
    "     \ }

    " Show only small text area
    Plug 'junegunn/goyo.vim'
        nnoremap <silent> <F4> :<C-U>Goyo<CR>

    " Highlight current paragraph
    Plug 'junegunn/limelight.vim'
        nnoremap <silent> <Leader><F4> :<C-U>Limelight!!<CR>

    " Highlight bad word choices
    " Plug 'reedes/vim-wordy', { 'for': [ 'text', 'markdown' ] }

    " Spell autocorrection
    " Plug 'sedm0784/vim-you-autocorrect', { 'for': [ 'text', 'markdown' ] }
        " autocmd! FileType markdown EnableAutocorrect
call plug#end()
