call matchup#util#append_match_words('/\*:\*/,#region:#endregion')
call textobj#user#plugin('region', {
\   '-': {
\     'pattern': ['#region', '#endregion'],
\     'select-a': 'ar',
\     'select-i': 'ir',
\   },
\ })
