call matchup#util#append_match_words('/\*:\*/,#region:#endregion,#if:#endif')
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
\     'select-i': 'iP',
\   },
\ })
