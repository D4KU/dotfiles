if g:lightactive
    runtime highlight_light.vim
else
    runtime highlight_dark.vim
endif

func! ToggleLight()
    if g:lightactive
        runtime highlight_dark.vim
        let g:lightactive = 0
    else
        runtime highlight_light.vim
        let g:lightactive = 1
    endif
endfunc
