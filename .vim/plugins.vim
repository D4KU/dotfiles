call plug#begin(has('win32') ? "~/vimfiles/plugged" : "~/.vim/plugged")
    " =========================== Tool integration ===========================
    " Ranger integration
    Plug 'francoiscabrol/ranger.vim', { 'on': ['Ranger', 'RangerWorkingDirectory'] }
        " Redirect the dependency on the BClose plugin to Bbye
        command -bang Bclose Bwipeout
        let g:ranger_map_keys = 0
        " let g:ranger_replace_netrw = 1
        nnoremap <silent> <Leader>f <Cmd>Ranger<CR>
        nnoremap <silent> <Leader>F <Cmd>RangerWorkingDirectory<CR>

    " Fuzzy file finder
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
        let g:fzf_layout = { 'window': 'enew' }

        " Thanks to clever-f plugin, : and , are free
        nnoremap <silent> ,         <Cmd>call fzf#smartpreview() <Bar> Buffers<CR>
        nnoremap <silent> :         <Cmd>call fzf#smartpreview() <Bar> History<CR>
        nnoremap <silent> <Leader>, <Cmd>call fzf#smartpreview() <Bar> Files<CR>
        nnoremap <silent> <Leader>. <Cmd>call fzf#smartpreview() <Bar> exec 'Files ' . expand('%:p:h')<CR>
        nnoremap <silent> <Leader>- <Cmd>call fzf#smartpreview() <Bar> Lines<CR>
        nnoremap <silent> <Leader>` <Cmd>call fzf#smartpreview() <Bar> Marks<CR>
        nnoremap <silent> <Leader>/ <Cmd>call fzf#smartpreview() <Bar> History/<CR>
        nnoremap <silent> <Leader>: <Cmd>call fzf#smartpreview() <Bar> History:<CR>
        nnoremap <silent> <Leader>! <Cmd>call fzf#smartpreview() <Bar> Helptags<CR>
        nnoremap <silent> <Leader>; <Cmd>call fzf#smartpreview() <Bar> Commands<CR>
        nnoremap <silent> <Leader>' <Cmd>call fzf#smartpreview() <Bar> Snippets<CR>
        nnoremap <silent> <Leader>" <Cmd>call fzf#smartpreview() <Bar> Colors<CR>

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
        inoremap <expr> <C-X>t fzf#vim#complete(fzf#wrap({
            \ 'options': '--query=""',
            \ 'source': function('tools#synonyms')}))

    " Tmux
    Plug 'christoomey/vim-tmux-navigator'

    " Git
    Plug 'tpope/vim-fugitive', { 'on': ['G', 'Gdiffsplit'] }

    " ======================== Improved visual feedback ======================
    " Color scheme
    Plug 'AlessandroYorba/Despacio'
    Plug 'pgdouyon/vim-yin-yang'

    " Status line style
    Plug 'itchyny/lightline.vim'
        let g:lightline = { 'colorscheme': 'daku' }
        let g:lightline.active = {
            \ 'left': [
                \ ['select', 'paste'],
                \ ['filename'],
                \ ['modified', 'readonly', 'filetype'],
                \ ],
            \ 'right': [],
            \ }
        let g:lightline.inactive = {
            \ 'left': [['filename'], ['modified']],
            \ 'right': [],
            \ }
        let g:lightline.component = {
            \ 'position': '%c %l/%L',
            \ 'select': '%{lightline#mode()==?"select"?"SELECT":""}',
            \ }
		let g:lightline.enable = {
            \ 'statusline': 1,
            \ 'tabline': 0,
            \ }

    " Preview registers
    Plug 'junegunn/vim-peekaboo'
        let g:peekaboo_window = 'vertical botright 90new'

    " Show marks on left border
    " Plug 'kshenoy/vim-signature'

    " Highlight colors in their... color
    Plug 'lilydjwg/colorizer'
        let g:colorizer_maxlines = 500

    " Highlight just yanked text
    Plug 'machakann/vim-highlightedyank'
        let g:highlightedyank_highlight_duration = 250

    " Highlight trailing whitespace
    Plug 'ntpeters/vim-better-whitespace'
        nnoremap <silent> ]w <Cmd>NextTrailingWhitespace<CR>
        nnoremap <silent> [w <Cmd>PrevTrailingWhitespace<CR>
        let g:better_whitespace_ctermcolor = 234
        let g:better_whitespace_filetypes_blacklist = [
            \ 'diff',
            \ 'gitcommit',
            \ 'unite',
            \ 'qf',
            \ 'help',
            \ 'markdown',
            \ 'minimap',
            \ ]

    " Highlight words equal to the one under cursor
    Plug 'RRethy/vim-illuminate'
        let g:Illuminate_delay = 100

    " Syntax highlighting for many languages
    Plug 'sheerun/vim-polyglot'
        let g:polyglot_disabled = ['autoindent', 'csv.plugin']
        let g:python_highlight_all = 1

    " Scroll buffer smoothly
    Plug 'terryma/vim-smooth-scroll'
        noremap <silent> <C-U> <Cmd>call smooth_scroll#up(&scroll, 0, 3)<CR>
        noremap <silent> <C-D> <Cmd>call smooth_scroll#down(&scroll, 0, 3)<CR>
        noremap <silent> <C-B> <Cmd>call smooth_scroll#up(&scroll*2, 0, 4)<CR>
        noremap <silent> <C-F> <Cmd>call smooth_scroll#down(&scroll*2, 0, 4)<CR>

    " Improved feedback on search
    Plug 'vim-scripts/IndexedSearch'

    " Shader file highlighting
    " Plug 'vim-scripts/ShaderHighLight'

    " Keep showing outer blocks on buffer top
    Plug 'wellle/context.vim'
        let g:context_border_char = ' '
        let g:context_highlight_tag = '<hide>'

    " File overview as scrollbar
    Plug 'wfxr/minimap.vim', { 'on': 'MinimapToggle' }
        let g:minimap_base_highlight = 'Comment'
        let g:minimap_cursor_color = 'IlluminatedWord'
        let g:minimap_search_color = 'Pmenu'
        let g:minimap_highlight_search = 1
        let g:minimap_git_colors = 1
        let g:minimap_left = 1
        let g:minimap_block_buftypes =
            \ ['nofile', 'nowrite', 'quickfix', 'terminal', 'prompt', 'help']
        noremap <Leader>~ <Cmd>MinimapToggle<CR>

    " Lines mark indentation level
    Plug 'Yggdroot/indentLine', { 'on': 'IndentLinesToggle' }
        let g:indentLine_enabled = 0
        let g:indentLine_char_list = ['¦']
        let g:indentLine_concealcursor = ''
        let g:indentLine_faster = 1
        noremap <silent> <Leader><Bar> <Cmd>IndentLinesToggle<CR>

    " ============================== New motions =============================
    " Camel case word motion
    Plug 'chaoren/vim-wordmotion'
        " Jump over these signs:
        let g:wordmotion_prefix = '<Leader>'
        let g:wordmotion_spaces = '_-./\(\)\[\]'

    " Vim motions on speed
    Plug 'easymotion/vim-easymotion'
        let g:EasyMotion_keys = "abcdefghijklmnopqrstuvwxyz"
        map <Leader><Leader><Leader> <Plug>(easymotion-overwin-f)

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
    Plug 'AndrewRadev/switch.vim', { 'on': '<Plug>(Switch)' }
        nmap gs <Plug>(Switch)
        let g:switch_custom_definitions =
            \ [
            \   ['==', '>=', '<='],
            \   ['and', 'or'],
            \   ['int', 'float', 'bool'],
            \   ['public', 'protected', 'private'],
            \ ]

    " Move around text-objects
    Plug 'D4KU/vim-pushover'
        let g:pushover_maps =
            \ {
            \   'w': ['iw', 'w', 'b'],
            \   'W': ['iW', 'W', 'B'],
            \   '<Leader>w': ['i<Leader>w', '<Leader>w', '<Leader>b'],
            \   'p': ['ip', '}j', '{k'],
            \   'f': ['af', '<Leader>j', '<Leader>k'],
            \ }

    " Tab completion in insert mode
    " Plug 'ervandew/supertab'

    " Mappings to toggle quickfix and loclist
    Plug 'Gavinok/vim-togglelist'
        noremap <Leader>l <Cmd>call togglelist#ToggleQuickfixList()<CR>
        noremap <Leader>L <Cmd>call togglelist#ToggleLocationList()<CR>

    " Easily align multiple lines of text
    Plug 'junegunn/vim-easy-align', { 'on': '<Plug>(LiveEasyAlign)' }
        " Interactive align for a motion/text object
        nmap <Leader>a <Plug>(LiveEasyAlign)
        " Interactive align in visual mode
        vmap <Leader>a <Plug>(LiveEasyAlign)

    " Quickly create tag hierarchies
    Plug 'mattn/emmet-vim', { 'for': 'html' }

    " Close buffer without closing window
    Plug 'moll/vim-bbye', { 'on': ['Bdelete', 'Bwipeout'] }

    " Add Readline commands to insert mode
    " Plug 'tpope/vim-rsi'
    "     let g:rsi_no_meta = 1

    " Comment text in and out
    Plug 'tpope/vim-commentary'

    " Ease session management
    " Plug 'tpope/vim-obsession'

    " More mappings
    Plug 'tpope/vim-unimpaired'

    " Plug 'hauleth/asyncdo.vim'

    " Surround anything with anything
    Plug 'tpope/vim-surround'

    " Exchange text
    Plug 'tommcdo/vim-exchange'

    " Completion for text in adjacent tmux panes
    Plug 'wellle/tmux-complete.vim'

    " Resize split to selection
    Plug 'wellle/visual-split.vim'

    " ============================== Autocommands ============================
    " Jump between pairs
    Plug 'andymass/vim-matchup'

    " Search for selection
    Plug 'bronson/vim-visual-star-search'

    " Text-objects for markdown
    Plug 'Tokubara/vim-textobj-markdown', { 'for': 'markdown' }

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
    Plug 'D4KU/vim-textobj-comment'
        let g:textobj_comment_no_default_key_mappings = 1
        xmap ax <Plug>(textobj-comment-a)
        omap ax <Plug>(textobj-comment-a)
        xmap ix <Plug>(textobj-comment-i)
        omap ix <Plug>(textobj-comment-i)
        xmap iX <Plug>(textobj-comment-big-i)
        omap iX <Plug>(textobj-comment-big-i)
        xmap aX <Plug>(textobj-comment-big-a)
        omap aX <Plug>(textobj-comment-big-a)

    " Function text object
    Plug 'jamesl33/vim-textobj-function', { 'for': ['cs', 'vim'] }

    " Text object for text after a character
    Plug 'junegunn/vim-after-object'
        autocmd VimEnter * call after_object#enable(
            \ ['P', 'p'],
            \ '=', ':', '-', '_', '/', ',', ';', '.', '*', '@', '(', ')',
            \ '[', ']', '{', '}', '<', '>')

    " Sub-clause / function argument text object
    Plug 'baabelfish/vim-argumentative'
        let g:argumentative_no_mappings = 1
        nmap [, <Plug>Argumentative_Prev
        nmap ], <Plug>Argumentative_Next
        xmap [, <Plug>Argumentative_XPrev
        xmap ], <Plug>Argumentative_XNext
        nmap <, <Plug>Argumentative_MoveLeft
        nmap >, <Plug>Argumentative_MoveRight

    " Text object for chained member access
    Plug 'D4KU/vim-textobj-chainmember', { 'for': 'cs' }

    " Text object for C-like if, while, function, class, ...
    Plug 'D4KU/vim-textobj-headedblock', { 'for': 'cs' }

    " Copy text to windows clipboard
    Plug 'kana/vim-fakeclip'

    " I and A to prepend/append to visual selection
    Plug 'kana/vim-niceblock'

    " Define mappings for simultaneously pressed keys
    " Plug 'kana/vim-arpeggio'
        " Arpeggio inoremap jk <Esc>
        " Arpeggio nmap jk <Plug>(easymotion-overwin-f)

    " Text object for last searched pattern entire buffer
    Plug 'kana/vim-textobj-user'
    Plug 'kana/vim-textobj-lastpat'
    Plug 'kana/vim-textobj-entire'
        let g:textobj_entire_no_default_key_mappings = 1
        xmap o <Plug>(textobj-entire-i)
        omap o <Plug>(textobj-entire-i)

    " Text object for indent level
    Plug 'paraduxos/vim-indent-object', { 'branch': 'new_branch' }
        onoremap ij <Esc><Cmd>call <SID>Indent()<CR>
        function! s:Indent()
            let g:indent_object_ignore_blank_line = 0
            execute 'normal ' . v:operator . 'ii'
            let g:indent_object_ignore_blank_line = 1
        endfunction

    " Automatically adjust shiftwidth to current document
    " Plug 'roryokane/detectindent'
    "     augroup DetectIndent
    "        autocmd! BufReadPost * DetectIndent
    "     augroup END
    " might be better in the future:
    Plug 'tpope/vim-sleuth'

    " Lastly pasted text object
    Plug 'saaguero/vim-textobj-pastedtext'
        let g:pastedtext_select_key = 'v'

    " Make plugin commands repeatable
    Plug 'tpope/vim-repeat'

    " Automatically close pairs
    Plug 'tmsvg/pear-tree'
        let g:pear_tree_map_special_keys = 1
        let g:pear_tree_smart_backspace = 1
        let g:pear_tree_smart_openers = 1
        let g:pear_tree_smart_closers = 1

    Plug 'vim-autoformat/vim-autoformat', {
        \ 'for': 'cs',
        \ 'on': 'AutoformatLine',
        \ }

        let g:formatdef_cs = 'clang-format -style=file'
        let g:formatters_cs = ['clangformat']
        let g:autoformat_verbosemode=1
        inoremap <Esc>a <Esc>:<C-U>AutoformatLine<CR>
        nnoremap gL :<C-U>AutoformatLine<CR>
        vnoremap gL :<C-U>'<,'>AutoformatLine<CR>

    " Many more text objects
    Plug 'wellle/targets.vim'
        let g:targets_nl = [ 'n', 'N' ]

    " Line text object
    " Plug 'wellle/line-targets.vim'

    " ============================== New gadgets =============================
    " Calculator
    Plug 'sk1418/HowMuch'

    " Translator
    Plug 'voldikss/vim-translator'
        let g:translator_target_lang = 'en'
        let g:translator_default_engines = ['google']
        let g:translator_window_type = 'popup'

        " Replace the text with translation
        nmap <Leader>t <Plug>TranslateR
        vmap <Leader>t <Plug>TranslateRV
        " Display translation
        nmap <Leader>T <Plug>TranslateW
        vmap <Leader>T <Plug>TranslateWV

        nnoremap <silent> <Leader>z <Cmd>let g:translator_target_lang =
            \ g:translator_target_lang == 'en' ? 'de' : 'en'
            \ <Bar> echo "New target lang: " . g:translator_target_lang<CR>

    " ======================= Command line improvements ======================
    " Search for multiple variants of a word
    Plug 'tpope/vim-abolish'

    " Rename currently edited file
    Plug 'vim-scripts/Rename2', { 'on': 'Rename' }

    " Identify and search for unicode characters
    Plug 'chrisbra/unicode.vim'

    " ============================== Coding ==================================
    " Show and edit git hunks
    Plug 'airblade/vim-gitgutter'
        let g:gitgutter_map_keys = 0
        let g:gitgutter_sign_modified = '·'
        let g:gitgutter_sign_modified_removed = '⨯'
        let g:gitgutter_sign_removed = '-'
        let g:gitgutter_sign_removed_above_and_below = '='
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

    " AI-assisted completion
    " Plug 'codota/tabnine-vim'
    " Plug 'kiteco/vim-plugin'
    "     let g:kite_supported_languages = ['*']
    "     let g:kite_log = 1

    " Linting and completion
    Plug 'dense-analysis/ale', {
        \ 'for': 'cs',
        \ 'on': '<Plug>(ale_lint)',
        \ }

        nmap gl <Plug>(ale_lint)
        nmap zh <Plug>(ale_previous_wrap)
        nmap zl <Plug>(ale_next_wrap)
        nmap zH <Plug>(ale_first)
        nmap zL <Plug>(ale_last)
        "set omnifunc=ale#completion#OmniFunc
        let g:ale_lint_on_text_changed = 'never'
        let g:ale_set_signs = 1
        let g:ale_sign_error = '·'
        let g:ale_sign_warning = '·'
        let g:ale_lint_on_insert_leave = 1
        let g:ale_lint_on_save = 1
        let g:ale_warn_about_trailing_whitespace = 0
        let g:ale_echo_msg_format = '[%linter%] %s'
        let g:ale_linters = {
            \ 'cs': [ 'OmniSharp' ]
            \ }
        let g:ale_fixers = {
            \ '*': [ 'remove_trailing_lines', 'trim_whitespace' ],
            \ 'python': [ 'autopep8', 'isort' ],
            \ 'cs': [ 'clang-format' ],
            \ }

    " Wrap and unwrap function arguments
    Plug 'foosoft/vim-argwrap', { 'on': '<Plug>(ArgWrapToggle)' }
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
    " Plug 'prabirshrestha/async.vim', { 'for': 'markdown' }
    Plug 'prabirshrestha/asyncomplete.vim', { 'for': 'cs' }
    Plug 'prabirshrestha/asyncomplete-buffer.vim', { 'for': 'cs' }
    " Plug 'high-moctane/asyncomplete-nextword.vim', { 'for': 'markdown' }
    Plug 'omniSharp/omnisharp-vim', { 'for': 'cs' }

    " Visual debugging
    " Plug 'puremourning/vimspector', { 'for': [ 'cs' ] }
    "     let g:vimspector_enable_mappings = 'VISUAL_STUDIO'

    " Snippet engine
    if has('python3')
        Plug 'sirver/ultisnips'
            let g:UltiSnipsExpandTrigger='<C-S>'
            let g:UltiSnipsJumpForwardTrigger=g:UltiSnipsExpandTrigger
            let g:UltiSnipsJumpBackwardTrigger='<C-Z>'

    endif

    " Makes vim a better merge tool for git
    Plug 'samoshkin/vim-mergetool', { 'on': 'MergetoolStart' }
        let g:mergetool_layout = 'mr'
        let g:mergetool_prefer_revision = 'local'
        nmap <expr> <Left>  &diff? '<Plug>(MergetoolDiffExchangeLeft)'  : '<Left>'
        nmap <expr> <Right> &diff? '<Plug>(MergetoolDiffExchangeRight)' : '<Right>'
        nmap <expr> <Up>    &diff? '[czz' : '<Up>'
        nmap <expr> <Down>  &diff? ']czz' : '<Down>'

        function! BuildYCM(info)
          if a:info.status == 'installed' || a:info.force
            !python3 ./install.py --clangd-completer
          endif
        endfunction
    Plug 'ycm-core/YouCompleteMe', {
        \   'for': ['python', 'cpp'],
        \   'do': function('BuildYCM')
        \   }
        let g:ycm_autoclose_preview_window_after_completion = 1
        let g:ycm_auto_hover = ''
        let g:syntastic_enable_signs = 0
        let g:syntastic_error_symbol = g:ale_sign_error
        let g:syntastic_warning_symbol = g:ale_sign_warning
        nmap <Leader>s <Plug>(YCMHover)
        nnoremap <Leader>u <Cmd>YcmCompleter GoToReferences<CR>
        nnoremap <Leader>i <Cmd>YcmCompleter GoToImplementation<CR>
        nnoremap <Leader>x <Cmd>YcmCompleter FixIt<CR>
        nnoremap <Leader>g :YcmCompleter GoToSymbol <C-R><C-W>

    " =========================== Writing prose ==============================
    " Preview markdown in browser
    " Plug 'iamcco/markdown-preview.nvim', {
    "     \ 'do': { -> mkdp#util#install() },
    "     \ 'for': ['markdown', 'vim-plug']
    "     \ }

    " Show only small text area
    Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
        nnoremap <silent> <F4> <Cmd>Goyo<CR>

    " Highlight current paragraph
    Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }
        nnoremap <silent> <Leader><F4> <Cmd>Limelight!!<CR>

    " Highlight bad word choices
    " Plug 'reedes/vim-wordy', { 'for': [ 'text', 'markdown' ] }

    " Spell autocorrection
    " Plug 'sedm0784/vim-you-autocorrect', { 'for': [ 'text', 'markdown' ] }
        " autocmd! FileType markdown EnableAutocorrect
call plug#end()
