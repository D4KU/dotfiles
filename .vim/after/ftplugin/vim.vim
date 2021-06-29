let b:pear_tree_pairs = extend(deepcopy(g:pear_tree_pairs), {
    \ 'if'      : {'closer': 'endif'      , 'not_at': ['\<[^i]']},
    \ 'function': {'closer': 'endfunction', 'not_at': ['\<[^f]']},
    \ 'while'   : {'closer': 'endwhile'   , 'not_at': ['\<[^w]']},
    \ }, 'keep')
