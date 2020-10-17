let colors_name = "daku_light"
let g:limelight_conceal_ctermfg = 250
let g:indentLine_color_term = 254

" Spell check
hi clear SpellBad
hi clear SpellCap
hi clear SpellLocal
hi SpellBad cterm=bold,underline
hi SpellLocal cterm=bold
hi SpellCap cterm=underline

hi LineNr ctermbg=None ctermfg=250
hi clear CursorLineNr
hi link CursorLineNr LineNr

hi ColorColumn ctermbg=white
hi CursorLine cterm=None ctermbg=254
hi clear CursorColumn
hi link CursorColumn CursorLine
hi Normal ctermbg=white
hi EndOfBuffer ctermfg=white
hi Search cterm=inverse
hi StatusLine cterm=None ctermbg=254 ctermfg=9
hi StatusLineNC cterm=None ctermbg=254 ctermfg=242
hi VertSplit ctermfg=white
hi Visual ctermbg=253
hi Folded ctermbg=None

" Signature plugin
hi clear SignColumn
" hi SignatureMarkText ctermbg=None
hi clear SignatureMarkText
hi SignatureMarkText ctermfg=245

" Illuminate Plugin
hi IlluminatedWord ctermbg=253
