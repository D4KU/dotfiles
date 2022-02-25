" Warp directory integration
function! wd#cd(pt)
    let l:path = trim(system("wd.sh path " . a:pt))
    if isdirectory(l:path)
        silent execute 'cd ' . l:path
        echo l:path
    else
        echo "Not a warp point"
    endif
endfunction
