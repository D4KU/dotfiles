let colors_name = "daku_dark"

" Background
hi clear Normal
hi Normal ctermbg=16

" Status line
hi StatusLine cterm=None ctermbg=233 ctermfg=9
hi StatusLineNC cterm=None ctermbg=233 ctermfg=242

" Tab line
hi TabLine cterm=None ctermbg=None ctermfg=245
hi TabLineSel ctermbg=235
hi TabLineFill cterm=None ctermbg=None

" End of Buffer
hi EndOfBuffer ctermfg=16

" Vertical split bar
hi VertSplit ctermfg=None ctermbg=None

" Cursor line
hi Cursor ctermfg=16
hi CursorLine cterm=None ctermbg=233
hi clear CursorColumn
hi link CursorColumn CursorLine
hi clear ColorColumn
hi ColorColumn ctermbg=16

hi LineNr ctermbg=None ctermfg=238
hi clear CursorLineNr
hi link CursorLineNr LineNr

" Spell check
hi clear SpellBad
hi clear SpellCap
hi clear SpellLocal
hi SpellBad cterm=bold,underline
hi SpellLocal cterm=bold
hi SpellCap cterm=underline

" Fold
hi Folded ctermfg=237
hi FoldColumn ctermfg=235

" Matching Bracket
hi clear Matchparen
hi Matchparen cterm=bold,underline

" Selection
hi clear Visual
hi Visual ctermbg=235

" Search (kinda covered by Illuminate)
hi clear Search
hi Search cterm=inverse
hi QuickfixLine cterm=bold

" Autocompletion Autocompletion popup
hi Pmenu ctermfg=246 ctermbg=233
hi PmenuSel ctermfg=256 ctermbg=234
hi clear PmenuSbar
" hi clear PmenuThumb
hi PmenuThumb ctermbg=235

" Diff mode
hi clear DiffAdd
hi clear DiffChange
hi clear DiffDelete
hi clear DiffText
hi DiffAdd ctermbg=234
"hi DiffChange ctermbg=16
hi DiffDelete ctermfg=236
hi DiffText ctermbg=52

" Signature plugin
hi clear SignColumn
hi clear SignatureMarkText
hi SignatureMarkText ctermfg=245

" ALE plugin
hi ALEError ctermfg=9
hi ALEErrorSign ctermfg=red
hi ALEWarningSign ctermfg=220

" Illuminate Plugin
hi IlluminatedWord ctermfg=95 ctermbg=None

" GitGutter Plugin
hi GitGutterAdd ctermfg=235
hi link GitGutterChange GitGutterAdd
hi link GitGutterDelete GitGutterAdd

hi link HighlightedyankRegion Visual
