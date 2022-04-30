" call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
"     \ 'name': 'buffer',
"     \ 'allowlist': ['*'],
"     \ 'completor': function('asyncomplete#sources#buffer#completor'),
"     \ 'config': {
"     \    'max_buffer_size': 5000000,
"     \ },
"     \ }))

onoremap iI <Esc><Cmd>call <SID>Indent(v:operator)<CR>
vnoremap iI <Esc><Cmd>call <SID>Indent('v')<CR>
function! s:Indent(operator)
    let g:indent_object_ignore_blank_line = 0
    execute 'normal ' . a:operator . 'ii'
    let g:indent_object_ignore_blank_line = 1
endfunction
