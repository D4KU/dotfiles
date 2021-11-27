" Use the stdio OmniSharp-roslyn server
let g:OmniSharp_server_stdio = 1

" If you have the .NET Framework installed in Windows, you may have better
" results using the Windows binaries.
let g:OmniSharp_translate_cygwin_wsl = 1

setlocal completeopt=menuone,noselect,preview
setlocal commentstring=//%s

" Fetch full documentation during omnicomplete requests.
" By default, only Type/Method signatures are fetched. Full documentation can
" still be fetched when you need it with the :OmniSharpDocumentation command.
let g:omnicomplete_fetch_full_documentation = 0
let g:OmniSharp_completion_without_overloads = 1
let g:OmniSharp_highlighting = 0
let g:OmniSharp_typeLookupInPreview = 1
let g:OmniSharp_diagnostic_showid = 1
" let g:OmniSharp_want_snippet = 1

" augroup omnisharp_commands
"     autocmd!
"     " Show type information automatically when the cursor stops moving.
"     autocmd CursorHold *.cs OmniSharpTypeLookup
" augroup END

" Trigger completion when certain characters are inserted
imap <silent> <buffer> , ,<Esc><Plug>(omnisharp_signature_help)a
imap <silent> <buffer> ( <Plug>(PearTreeOpener_()<Esc><Plug>(omnisharp_signature_help)a
inoremap <silent> <buffer> . .<C-X><C-O>

" Create vertical split only if there are no windows to left or right to reuse
function! RecycleVSplit()
    if winnr() != winnr('l')
        execute winnr('l') . 'wincmd q'
        vsplit
    elseif winnr() != winnr('h')
        execute winnr('h') . 'wincmd q'
        topleft vsplit
    else
        vsplit
    endif
endfunction

" The following commands are contextual, based on the cursor position.
nmap <silent> <buffer> <Leader>d <Plug>(omnisharp_go_to_definition)
nmap <silent> <buffer> <Leader>D <Cmd>call RecycleVSplit()<CR><Plug>(omnisharp_go_to_definition)
nmap <silent> <buffer> <Leader>i <Plug>(omnisharp_find_implementation)
nmap <silent> <buffer> <Leader>I <Plug>(omnisharp_preview_implementation)
nmap <silent> <buffer> <Leader>g <Plug>(omnisharp_find_type)
nmap <silent> <buffer> <Leader>G <Plug>(omnisharp_find_symbol)
nmap <silent> <buffer> <Leader>u <Plug>(omnisharp_find_usages)

" Finds members in the current buffer
nmap <silent> <buffer> <Leader>m <Plug>(omnisharp_find_members)
nmap <silent> <buffer> <Leader>x <Plug>(omnisharp_fix_usings)
nmap <silent> <buffer> <Leader>h <Plug>(omnisharp_documentation)
nmap <silent> <buffer> <Leader>s <Plug>(omnisharp_signature_help)
imap <silent> <buffer> <C-X>h <Plug>(omnisharp_signature_help)

" Find all code errors/warnings for the current solution and populate
" the quickfix window
nmap <silent> <buffer> <Leader>c <Plug>(omnisharp_global_code_check)

" Navigate up and down by method/property/field
nmap <silent> <buffer> <Leader>k <Plug>(omnisharp_navigate_up)
nmap <silent> <buffer> <Leader>j <Plug>(omnisharp_navigate_down)

" Contextual code actions
nmap <silent> <buffer> <Leader><CR> <Plug>(omnisharp_code_actions)
xmap <silent> <buffer> <Leader><CR> <Plug>(omnisharp_code_actions)

" Repeat the last code action performed (does not use a selector)
nmap <silent> <buffer> <Leader>@ <Plug>(omnisharp_code_action_repeat)
xmap <silent> <buffer> <Leader>@ <Plug>(omnisharp_code_action_repeat)

" Rename with dialog
nmap <silent> <buffer> <F2> <Plug>(omnisharp_rename)

" Rename without dialog - with cursor on the symbol to rename
command! -nargs=1 R :call OmniSharp#actions#rename#To("<args>")

nmap <silent> <buffer> <Leader>= <Plug>(omnisharp_code_format)

" Toggle between normal and expression function body
nnoremap <Leader>b ^f="_cW<BS><CR><C-O>O{<Esc>jo}<Esc>k
nnoremap <Leader>B "_yiB]}dd[{ddkJa=><Space><Esc>

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
let g:OmniSharp_popup_options = {
    \ 'padding': [1, 2, 1, 2],
    \ 'scrollbar': 0,
    \}

let dotNetUrl="'https://docs.microsoft.com/en-us/search/?terms=%&category=Reference&scope=.NET'"
let unityUrl="'https://docs.unity3d.com/2020.2/Documentation/ScriptReference/30_search.html?q=%'"
noremap <silent> <Leader>K :call Doc(dotNetUrl)<CR>
noremap <silent> <Leader>U :call Doc(unityUrl)<CR>
