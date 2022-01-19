function! colors_light#apply() abort
    let g:better_whitespace_ctermcolor = 254
    let g:indentLine_color_term = 254
    let g:limelight_conceal_ctermfg = 250

    hi ColorColumn                                ctermbg=white
    hi CursorLine   cterm=None      ctermbg=254
    hi FoldColumn                   ctermfg=252   ctermbg=None
    hi Folded                                     ctermbg=None
    hi LineNr                       ctermfg=250   ctermbg=None
    hi Matchparen                   ctermfg=None  ctermbg=195
    hi Normal                                     ctermbg=white
    hi Pmenu                        ctermfg=240   ctermbg=254
    hi PmenuSel                     ctermfg=232   ctermbg=255
    hi PmenuThumb                                 ctermbg=235
    hi Search       cterm=inverse
    hi SpellBad     cterm=underline ctermfg=None  ctermbg=None
    hi SpellCap     cterm=italic    ctermfg=None  ctermbg=None
    hi SpellLocal   cterm=bold
    hi StatusLine   cterm=None      ctermfg=9     ctermbg=254
    hi StatusLineNC cterm=None      ctermfg=242   ctermbg=254
    hi Visual                                     ctermbg=253
    hi VertSplit                    ctermfg=white

    hi clear CursorColumn
    hi clear CursorLineNr
    hi clear PmenuSbar
    hi clear SignColumn
    hi clear SpellLocal

    hi link CursorColumn CursorLine
    hi link IlluminatedWord MatchParen
    hi link HighlightedyankRegion Visual
endfunction
