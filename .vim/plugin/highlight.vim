try
    colorscheme despacio
    hi Number ctermfg=9
    catch
        try
            colorscheme delek
            catch
        endtry
endtry

" Background
hi clear Normal
hi Normal ctermbg=black

" Status line
hi StatusLine cterm=None ctermbg=233 ctermfg=9
hi StatusLineNC cterm=None ctermbg=233 ctermfg=242

" Tab line
hi TabLine cterm=None ctermbg=None ctermfg=245
hi TabLineSel ctermbg=235
hi TabLineFill cterm=None ctermbg=None

" End of Buffer
highlight EndOfBuffer ctermfg=black

" Vertical split bar
hi VertSplit ctermfg=None ctermbg=None

" Cursor line
hi CursorLine cterm=None ctermbg=233
hi clear CursorColumn
hi CursorColumn cterm=None ctermbg=232
hi clear ColorColumn
hi ColorColumn ctermbg=black

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
" hi Folded ctermbg=None ctermfg=1

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

" Autocompletion popup
hi clear Pmenu
hi clear PmenuSbar
hi clear PmenuThumb
hi PmenuThumb ctermbg=235

" Diff mode
hi clear DiffAdd
hi clear DiffChange
hi clear DiffDelete
hi clear DiffText
hi clear FoldColumn
hi DiffAdd ctermbg=234
"hi DiffChange ctermbg=232
hi DiffDelete ctermfg=236
hi DiffText ctermbg=52

" Signature plugin
hi clear SignColumn
hi clear SignatureMarkText
hi SignatureMarkText ctermfg=245

" ALE plugin
hi ALEError ctermbg=red
hi ALEErrorSign ctermfg=red
hi ALEWarningSign ctermfg=220

" Illuminate Plugin
hi IlluminatedWord ctermbg=235
