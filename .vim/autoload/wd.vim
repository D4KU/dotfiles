" Warp directory integration
function! wd#cd(pt)
    let l:cmd = "$ZPFX/../plugins/mfaerevaag---wd/wd.sh path " . a:pt
    let l:path = trim(system(l:cmd))
    if isdirectory(l:path)
        silent execute 'cd ' . l:path
        echo l:path
    else
        echo "Not a warp point"
    endif
endfunction
