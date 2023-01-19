function! DarkColorsApply() abort
    let g:better_whitespace_ctermcolor = 234
    let g:better_whitespace_guicolor = '#333333'
    let g:indentLine_color_term = 235
    let g:limelight_conceal_ctermfg = 238
    let g:limelight_conceal_guifg = '#555555'

    hi ColorColumn                               ctermbg=NONE               guibg=bg
    hi Cursor                       ctermfg=16                guifg=black
    hi CursorLine   cterm=NONE                   ctermbg=233                guibg=#111111
    hi DiffAdd                      ctermfg=NONE ctermbg=232  guifg=NONE    guibg=#102000
    hi DiffChange                   ctermfg=NONE ctermbg=0    guifg=NONE    guibg=#141414
    hi DiffDelete                   ctermfg=233  ctermbg=NONE guifg=#440000 guibg=NONE
    hi DiffText     cterm=italic    ctermfg=NONE ctermbg=0    guifg=NONE    guibg=#141414
    hi EndOfBuffer                  ctermfg=NONE
    hi FoldColumn                   ctermfg=235  ctermbg=NONE guifg=#333333 guibg=NONE
    hi Folded                       ctermfg=237  ctermbg=NONE guifg=#333333 guibg=NONE
    hi LineNr                       ctermfg=238  ctermbg=NONE guifg=#444444 guibg=NONE
    hi Matchparen                   ctermfg=95   ctermbg=NONE guifg=#806060 guibg=NONE
    hi Normal                                    ctermbg=NONE               guibg=NONE
    hi Pmenu                        ctermfg=246  ctermbg=233  guifg=#777777 guibg=#111111
    hi PmenuSel                     ctermfg=256  ctermbg=234  guifg=#AAAAAA guibg=#222222
    hi PmenuThumb                                ctermbg=235  guifg=#AAAAAA guibg=#222222
    hi QuickfixLine cterm=bold
    hi Search       cterm=inverse   ctermfg=NONE ctermbg=NONE guifg=NONE    guibg=NONE
    hi SpellBad     cterm=underline ctermfg=NONE ctermbg=NONE guifg=NONE    guibg=NONE
    hi SpellCap     cterm=NONE      ctermfg=NONE ctermbg=NONE guifg=NONE    guibg=NONE
    hi StatusLine   cterm=NONE      ctermfg=9    ctermbg=233                guibg=#111111
    hi StatusLineNC cterm=NONE      ctermfg=242  ctermbg=233                guibg=#080808
    hi TabLine      cterm=NONE      ctermfg=245  ctermbg=NONE               guibg=NONE
    hi TabLineFill  cterm=NONE                   ctermbg=NONE               guibg=NONE
    hi TabLineSel                                ctermbg=235
    hi Visual                       ctermfg=NONE ctermbg=235  guifg=NONE    guibg=#222222
    hi VertSplit                    ctermfg=NONE ctermbg=NONE guifg=bg      guibg=NONE

    hi clear CursorLineNr
    hi clear PmenuSbar
    hi clear SignColumn
    hi clear SpellLocal

    hi link CursorColumn CursorLine

    " Plugins ----------------------------------------------------------------
    " ALE
    hi ALEError ctermfg=9
    hi ALEWarning ctermfg=94
    hi link ALEErrorSign ALEError
    hi link ALEWarningSign ALEWarning

    " Illuminate
    hi link IlluminatedWord MatchParen

    " GitGutter
    hi GitGutterAdd ctermfg=235
    hi link GitGutterChange GitGutterAdd
    hi link GitGutterDelete GitGutterAdd

    " YouCompleteMe
    " hi link SyntasticErrorLine ALEError
    hi link SyntasticError ALEError
    hi link SyntasticErrorSign ALEErrorSign

    " Highlighted Yank
    hi link HighlightedyankRegion Search
endfunction

" Create mapping that is repeatable
function! RepeatableMap(name, lhs, rhs, mode)
    " make <Plug>name map to rhs
    execute a:mode . 'noremap <silent> <Plug>' . a:name . ' ' . a:rhs .
        \ ' :call repeat#set("\<Plug>' . a:name . '", v:count)<CR>'

    " make lhs map to <Plug>name
    execute a:mode . 'map ' . a:lhs . ' <Plug>' . a:name
endfunction

" Things to do in large files
function! LargeFile(fname)
    if getfsize(a:fname) >= 100000
        let g:OmniSharp_highlighting = 1
        set nowrap
        DisableWhitespace
        call RemoveCursorMatch()

        augroup WSLCursorFix
            autocmd!
        augroup END
    else
        let g:OmniSharp_highlighting = 3
        set wrap
        EnableWhitespace
        call AddCursorMatch()

        " Overwrite windows terminal's cursor style
        augroup WSLCursorFix
            autocmd!
            autocmd WinEnter,InsertLeave * call AddCursorMatch()
            autocmd WinLeave,InsertEnter * call RemoveCursorMatch()
        augroup END
    endif
endfunction

function! AddCursorMatch()
    silent! call matchadd('Cursor', '\%#', 900, 88)
endfunction

function! RemoveCursorMatch()
    silent! call matchdelete(88)
endfunction
