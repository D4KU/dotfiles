" Open best Fasd file match if arg passed, open FZF if not
function! fasd#v(str)
    if a:str == ""
        call fzf#run({'source': 'fasd -flR', 'sink': 'e'})
    else
        let cmd = 'fasd -f1 ' . a:str
        execute 'e ' . system(cmd)
    endif
endfunction

" Change to best Fasd directory match if arg passed, open FZF if not
function! fasd#z(str)
    if a:str == ""
        call fzf#run({'source': 'fasd -dlR', 'sink': 'cd'})
    else
        let cmd = 'fasd -d1 ' . a:str
        execute 'e ' . system(cmd)
    endif
endfunction
