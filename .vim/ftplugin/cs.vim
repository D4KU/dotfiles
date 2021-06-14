" Use the stdio OmniSharp-roslyn server
let g:OmniSharp_server_stdio = 1

" If you have the .NET Framework installed in Windows, you may have better
" results using the Windows binaries.
let g:OmniSharp_server_path = '/mnt/c/omnisharp/OmniSharp.exe'
let g:OmniSharp_translate_cygwin_wsl = 1

" Don't autoselect first omnicomplete option, show options even if there is only
" one (so the preview documentation is accessible).
setlocal completeopt=longest,menuone,preview,popuphidden
setlocal commentstring=//%s

" Fetch full documentation during omnicomplete requests.
" By default, only Type/Method signatures are fetched. Full documentation can
" still be fetched when you need it with the :OmniSharpDocumentation command.
let g:omnicomplete_fetch_full_documentation = 0
let g:OmniSharp_selector_findusages = 'fzf'
let g:OmniSharp_completion_without_overloads = 1
let g:OmniSharp_highlighting = 0
let g:OmniSharp_typeLookupInPreview = 1
" let g:OmniSharp_want_snippet = 1

" augroup omnisharp_commands
"     autocmd!
"     " Show type information automatically when the cursor stops moving.
"     autocmd CursorHold *.cs OmniSharpTypeLookup
" augroup END

" Trigger completion when certain characters are inserted
" <C-O> not working correctly, <Esc>...a does
imap <silent> <buffer> , ,<Esc><Plug>(omnisharp_signature_help)a
imap <silent> <buffer> ( (<Esc><Plug>(omnisharp_signature_help)a
inoremap <silent> <buffer> . .<C-X><C-O>

" The following commands are contextual, based on the cursor position.
nmap <silent> <buffer> <Leader>d <Plug>(omnisharp_go_to_definition)
nmap <silent> <buffer> <Leader>D <Plug>(omnisharp_preview_definition)
nmap <silent> <buffer> <Leader>i <Plug>(omnisharp_find_implementation)
nmap <silent> <buffer> <Leader>I <Plug>(omnisharp_preview_implementation)
nmap <silent> <buffer> <Leader>g <Plug>(omnisharp_find_type)
nmap <silent> <buffer> <Leader>G <Plug>(omnisharp_find_symbol)
nmap <silent> <buffer> <Leader>u <Plug>(omnisharp_find_usages)

" Finds members in the current buffer
nmap <silent> <buffer> <Leader>m <Plug>(omnisharp_find_members)
nmap <silent> <buffer> <Leader>x <Plug>(omnisharp_fix_usings)
nmap <silent> <buffer> <Leader>h <Plug>(omnisharp_type_lookup)
nmap <silent> <buffer> <F1> <Plug>(omnisharp_documentation)
nmap <silent> <buffer> <Leader>s <Plug>(omnisharp_signature_help)
imap <silent> <buffer> <C-X>h <Plug>(omnisharp_signature_help)

" Find all code errors/warnings for the current solution and populate
" the quickfix window
nmap <silent> <buffer> <Leader>c <Plug>(omnisharp_global_code_check)

" Navigate up and down by method/property/field
nmap <silent> <buffer> <Leader>k <Plug>(omnisharp_navigate_up)
nmap <silent> <buffer> <Leader>j <Plug>(omnisharp_navigate_down)

" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
nmap <silent> <buffer> <Leader>. <Plug>(omnisharp_code_actions)

" Run code actions with text selected in visual mode to extract method
xmap <silent> <buffer> <Leader><Space> <Plug>(omnisharp_code_actions)

" Repeat the last code action performed (does not use a selector)
nmap <silent> <buffer> <Leader>> <Plug>(omnisharp_code_action_repeat)
xmap <silent> <buffer> <Leader>> <Plug>(omnisharp_code_action_repeat)

" Rename with dialog
nmap <silent> <buffer> <F2> <Plug>(omnisharp_rename)

" Rename without dialog - with cursor on the symbol to rename
command! -nargs=1 R :call OmniSharp#actions#rename#To("<args>")

nmap <silent> <buffer> <Leader>= <Plug>(omnisharp_code_format)

let g:OmniSharp_highlight_groups = {
    \ 'FieldName': 'Normal',
    \ 'LocalName': 'Normal',
    \ 'PropertyName': 'Normal',
    \ 'Operator': 'Operator',
    \ 'Punctuation': 'Operator',
    \ 'ClassName': 'Special',
    \ 'StructName': 'Special',
    \ 'EnumName': 'Special'
    \}
