function! colors_light#apply() abort
    let g:better_whitespace_ctermcolor = 254
    let g:indentLine_color_term = 254
    let g:limelight_conceal_ctermfg = 250

    hi ColorColumn                                ctermbg=white           guibg=bg
    hi CursorLine   cterm=NONE      ctermbg=254
    hi EndOfBuffer                  ctermfg=NONE
    hi FoldColumn                   ctermfg=252   ctermbg=NONE
    hi Folded                                     ctermbg=NONE
    hi LineNr                       ctermfg=250   ctermbg=NONE
    hi Matchparen                   ctermfg=NONE  ctermbg=195             guibg=#CCEDFF
    hi Normal                                     ctermbg=white
    hi Pmenu                        ctermfg=240   ctermbg=254
    hi PmenuSel                     ctermfg=232   ctermbg=255
    hi PmenuThumb                                 ctermbg=235
    hi Search       cterm=inverse
    hi SpellBad     cterm=underline ctermfg=NONE  ctermbg=NONE
    hi SpellCap     cterm=italic    ctermfg=NONE  ctermbg=NONE
    hi SpellLocal   cterm=bold
    hi StatusLine   cterm=NONE      ctermfg=9     ctermbg=254
    hi StatusLineNC cterm=NONE      ctermfg=242   ctermbg=254
    hi Visual                                     ctermbg=253
    hi VertSplit                    ctermfg=white              guifg=bg

    hi clear CursorColumn
    hi clear CursorLineNr
    hi clear PmenuSbar
    hi clear SignColumn
    hi clear SpellLocal

    hi link CursorColumn CursorLine
    hi link IlluminatedWord MatchParen
    hi link HighlightedyankRegion Visual
endfunction
