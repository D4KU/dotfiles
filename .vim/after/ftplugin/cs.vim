call matchup#util#append_match_words('/\*:\*/,#region:#endregion,#if:#else:#endif')
call matchup#util#append_match_words('#pragma warning disable:#pragma warning restore')

call textobj#user#plugin('preprocesor', {
\   'region': {
\     'pattern': ['#region', '#endregion'],
\     'select-a': 'ar',
\     'select-i': 'ir',
\   },
\   'if': {
\     'pattern': ['#if', '#endif'],
\     'select-a': 'ad',
\     'select-i': 'id',
\   },
\   'warning': {
\     'pattern': ['#pragma warning disable', '#pragma warning restore.*'],
\     'select-a': 'aP',
\     'select-i': 'iP',
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
