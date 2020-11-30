if exists("g:AutoPairs")
    let b:AutoPairs = AutoPairsDefine({
        \ '\^\s\*\zsfunction' : 'endfunction//n',
        \ '\^\s\*\zsif' : 'endif//n'
        \ })
endif
