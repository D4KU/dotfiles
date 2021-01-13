let b:pear_tree_pairs = extend(deepcopy(g:pear_tree_pairs), {
            \ 'snippet': {'closer': 'endsnippet', 'not_at': ['\<[^s]']},
    \ }, 'keep')
