augroup DarkColorOverride
    autocmd!
    autocmd ColorScheme yin      call s:Override()
    autocmd ColorScheme despacio call s:Override() | hi Number ctermfg=9
augroup END

function! s:Override() abort
    let g:better_whitespace_ctermcolor = 234
    let g:indentLine_color_term = 235
    let g:limelight_conceal_ctermfg = 238

    hi ColorColumn                               ctermbg=16
    hi Cursor                       ctermfg=16
    hi CursorLine   cterm=None                   ctermbg=233
    hi DiffAdd                      ctermfg=None ctermbg=232
    hi DiffChange                   ctermfg=None ctermbg=0
    hi DiffDelete                   ctermfg=233  ctermbg=None
    hi DiffText     cterm=italic    ctermfg=None ctermbg=0
    hi EndOfBuffer                  ctermfg=None
    hi FoldColumn                   ctermfg=235  ctermbg=None
    hi Folded                       ctermfg=237  ctermbg=None
    hi LineNr                       ctermfg=238  ctermbg=None
    hi Matchparen                   ctermfg=95   ctermbg=None
    hi Normal                                    ctermbg=None
    hi Pmenu                        ctermfg=246  ctermbg=233
    hi PmenuSel                     ctermfg=256  ctermbg=234
    hi PmenuThumb                                ctermbg=235
    hi QuickfixLine cterm=bold
    hi Search       cterm=inverse   ctermfg=None ctermbg=None
    hi SpellBad     cterm=underline ctermfg=None ctermbg=None
    hi SpellCap     cterm=italic    ctermfg=None ctermbg=None
    hi StatusLine   cterm=None      ctermfg=9    ctermbg=233
    hi StatusLineNC cterm=None      ctermfg=242  ctermbg=233
    hi TabLine      cterm=None      ctermfg=245  ctermbg=None
    hi TabLineFill  cterm=None                   ctermbg=None
    hi TabLineSel                                ctermbg=235
    hi VertSplit                    ctermfg=None ctermbg=None
    hi Visual                       ctermfg=None ctermbg=235

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

    " Highlighted Yank
    hi link HighlightedyankRegion Visual
endfunction