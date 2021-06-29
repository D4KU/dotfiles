let b:pear_tree_pairs = extend(deepcopy(g:pear_tree_pairs), {
    \ '#region': {'closer': '#endregion', 'not_at': ['\<[^#]']},
    \ }, 'keep')

call matchup#util#append_match_words('/\*:\*/,#region:#endregion')
