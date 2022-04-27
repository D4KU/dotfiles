call matchup#util#append_match_words('/\*:\*/,#region:#endregion,#if:#else:#endif')
call matchup#util#append_match_words('#pragma warning disable:#pragma warning restore')

let s:a = '.*\(\n^\w*\n\)*'
call textobj#user#plugin('preprocesor', {
\   'region': {
\     'pattern': ['.*#region.*\n', '.*#endregion' . s:a],
\     'select-a': 'ar',
\     'select-i': 'ir',
\     'region-type': 'V',
\   },
\   'if': {
\     'pattern': ['.*#if.*\n', '.*#endif' . s:a],
\     'select-a': 'ad',
\     'select-i': 'id',
\     'region-type': 'V',
\   },
\   'warning': {
\     'pattern': ['.*#pragma warning disable.*\n', '.*#pragma warning restore' . s:a],
\     'select-a': 'aP',
\     'select-i': 'iP',
\     'region-type': 'V',
\   }
\ })

call textobj#user#plugin('conditional', {
\   'i': {
\     'pattern': '.*\((\|&&\?\|||\?\)\zs.\{-}\%#.\{-}\ze\()\|$\|&&\?\|||\?\)',
\     'select': 'i&',
\   },
\   'a': {
\     'pattern': '.*\((\zs\|\zs\(&&\|||\)\).\{-}\%#.\{-}\(\(&&\?\|||\?\)\s*\ze\|\ze)\|$\)',
\     'select': 'a&',
\   }
\ })

let b:pear_tree_pairs = extend(deepcopy(g:pear_tree_pairs), {
\ '<': {'closer': '>', 'not_at': ['\W'], 'not_in': ['String', 'csParens']},
\ }, 'keep')
