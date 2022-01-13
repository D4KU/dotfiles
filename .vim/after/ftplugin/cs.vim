call matchup#util#append_match_words('/\*:\*/,#region:#endregion,#if:#else:#endif')
call matchup#util#append_match_words('#pragma warning disable:#pragma warning restore')

call textobj#user#plugin('preprocesors', {
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
\   },
\   'conditional': {
\     'pattern': ['\((\|&&\|||\)', ' \?\ze\()\|$\|&&\|||\)'],
\     'select-a': 'a&',
\     'select-i': 'i&',
\   },
\ })
