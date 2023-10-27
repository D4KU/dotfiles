" call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
"     \ 'name': 'buffer',
"     \ 'allowlist': ['*'],
"     \ 'completor': function('asyncomplete#sources#buffer#completor'),
"     \ 'config': {
"     \    'max_buffer_size': 5000000,
"     \ },
"     \ }))

if exists("g:loaded_switch")
    let g:switch_custom_definitions =
        \ [
        \   ['==', '>=', '<='],
        \   switch#Words(['and', 'or']),
        \   switch#Words(['int', 'float', 'bool']),
        \   switch#Words(['public', 'internal', 'protected', 'private']),
        \   switch#Words(['abstract', 'override', 'virtual']),
        \ ]
endif

if exists("g:indent_object_ignore_blank_line")
    onoremap iI <Esc><Cmd>call <SID>Indent(v:operator)<CR>
    vnoremap iI <Esc><Cmd>call <SID>Indent('v')<CR>
    function! s:Indent(operator)
        let g:indent_object_ignore_blank_line = 0
        execute 'normal ' . a:operator . 'ii'
        let g:indent_object_ignore_blank_line = 1
    endfunction
    " One impossible case: with the cursor on line a you can't select
    " lines a and b exclusively via this plugin
    " aaaaaa
    "   bbbb
    " cccccc
endif

if exists('g:loaded_better_whitespace_plugin')
    " Delete annoying commands
    delcommand DisableStripWhitespaceOnSave
    delcommand EnableStripWhitespaceOnSave
    delcommand ToggleStripWhitespaceOnSave
    delcommand ToggleWhitespace
    delcommand StripWhitespaceOnChangedLines
endif
