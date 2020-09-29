" Automatically close angled brackets when preceded by word
let b:AutoPairs = AutoPairsDefine({'\w\zs<':'>'})

" Move inserted ; to the end of the line
inoremap <buffer> ; <end>;
