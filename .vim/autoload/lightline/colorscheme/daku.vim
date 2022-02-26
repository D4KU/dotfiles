let s:black = [ '#080808', '0' ]
let s:black2 = [ '#111111', '233' ]
let s:gray = [ '#222222', '234' ]
let s:gray2 = [ '#383838', '236' ]
let s:gray3 = [ '#4e4e4e', '242' ]
let s:gray4 = [ '#AAAAAA', '250' ]
let s:red = [ '#d70000', '9' ]

let s:p = {'normal': {}, 'inactive': {}}
let s:p.normal.left = [ [ s:black, s:red ], [ s:gray4, s:gray2 ], [ s:gray4, s:gray ] ]
let s:p.normal.right = [ [ s:gray3, s:gray ], [ s:gray3, s:gray3 ], [ s:gray2, s:black2 ] ]
let s:p.inactive.left =  [ [ s:gray3, s:black2 ], [ s:gray3, s:black2 ] ]
let s:p.normal.middle = [ [ s:gray, s:black2 ] ]
let s:p.inactive.middle = [ [ s:black2, s:black ] ]

let g:lightline#colorscheme#daku#palette = lightline#colorscheme#flatten(s:p)
