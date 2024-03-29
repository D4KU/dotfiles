setlocal commentstring=//%s

let g:OmniSharp_translate_cygwin_wsl = 1
let g:omnicomplete_fetch_full_documentation = 0
let g:OmniSharp_completion_without_overloads = 1
let g:OmniSharp_typeLookupInPreview = 1
" let g:OmniSharp_highlighting = 3
" let g:OmniSharp_diagnostic_showid = 1
" let g:OmniSharp_want_snippet = 1

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

" Trigger completion when certain characters are inserted
vnoremap <buffer> <expr> I <SID>RememberBlockVisualState()
imap <silent> <buffer> <expr> , exists('b:in_block_insert') ? ',' : ',<Esc><Plug>(omnisharp_signature_help)a'
imap <silent> <buffer> <expr> ( exists('b:in_block_insert') ? '(' : '<Plug>(PearTreeOpener_()<Esc><Plug>(omnisharp_signature_help)a'
inoremap <silent> <buffer> . .<C-X><C-O>

" The following commands are contextual, based on the cursor position.
nmap <silent> <buffer> <Leader>d <Plug>(omnisharp_go_to_definition)
nmap <silent> <buffer> <Leader>D <Cmd>call tools#recycleVSplit()<CR><Plug>(omnisharp_go_to_definition)
nmap <silent> <buffer> <Leader>i <Plug>(omnisharp_find_implementations)
nmap <silent> <buffer> <Leader>I <Plug>(omnisharp_preview_implementation)
nmap <silent> <buffer> <Leader>g <Plug>(omnisharp_find_type)
nmap <silent> <buffer> <Leader>G <Plug>(omnisharp_find_symbol)
nmap <silent> <buffer> <Leader>u <Plug>(omnisharp_find_usages)
nmap <silent> <buffer> <F2> <Plug>(omnisharp_rename)

" Finds members in the current buffer
nmap <silent> <buffer> <Leader>m <Plug>(omnisharp_find_members)
nmap <silent> <buffer> <Leader>x <Plug>(omnisharp_fix_usings)
nmap <silent> <buffer> <Leader>h <Plug>(omnisharp_documentation)
nmap <silent> <buffer> <Leader>s <Plug>(omnisharp_signature_help)
imap <silent> <buffer> <C-X>h <Plug>(omnisharp_signature_help)

" Find all code errors/warnings for the current solution and populate
" the quickfix window
nmap <silent> <buffer> <Leader>C <Plug>(omnisharp_global_code_check)
nmap <silent> <buffer> <Leader>= <Plug>(omnisharp_code_format)

" Navigate up and down by method/property/field
nmap <silent> <buffer> <Leader>k <Plug>(omnisharp_navigate_up)
nmap <silent> <buffer> <Leader>j <Plug>(omnisharp_navigate_down)

" Contextual code actions
nmap <silent> <buffer> <Leader><CR> <Plug>(omnisharp_code_actions)
xmap <silent> <buffer> <Leader><CR> <Plug>(omnisharp_code_actions)

" Repeat the last code action performed (does not use a selector)
nmap <silent> <buffer> <Leader>q <Plug>(omnisharp_code_action_repeat)
xmap <silent> <buffer> <Leader>q <Plug>(omnisharp_code_action_repeat)

" Toggle between normal and expression function body
nnoremap <Leader>P <Cmd>call ToggleExpressionBody()<CR>

" Insert base method call
nnoremap <Leader>O O<Esc>"_cc<Esc>[{k%%By%2<C-O>pIbase.<Esc>A;<Esc>==%%l

" Turn one-line body into Allman body
nnoremap <Leader>A viB:s/;/;\r<CR>%hR<CR>{<CR><Esc>=aB

" Look up documentation
let dotNetUrl="'https://docs.microsoft.com/en-us/search/?terms=%&category=Reference&scope=.NET'"
let unityUrl="'https://docs.unity3d.com/2020.2/Documentation/ScriptReference/30_search.html?q=%'"
nnoremap <silent> <Leader>K :call tools#doc(dotNetUrl)<CR>
nnoremap <silent> <Leader>U :call tools#doc(unityUrl)<CR>

" Rename without dialog - with cursor on the symbol to rename
command! -nargs=1 R :call OmniSharp#actions#rename#To("<args>")

function! ToggleExpressionBody()
    let l:line = getline('.')
    let l:idx = stridx(l:line, '=>')
    if l:idx < 0
        execute "normal! \"_yiB]}\"_dd[{\"_ddkJa=>\<Space>\<Esc>"
        " Remove 'return'
        call setline('.', substitute(getline('.'), 'return ', '', ''))
    else
        let l:line2 = getline(line('.') - 1)
        let l:return = stridx(l:line , 'void') < 0
                  \ && stridx(l:line2, 'void') < 0
                  \ ? 'return ' : ''
        execute 'normal! ' . l:idx . "|l\"_dwi{\<CR>" . l:return "\<C-O>o}\<Esc>"
    endif
endfunction

function! s:RememberBlockVisualState()
    let b:in_block_insert = 1
    return 'I'
endfunction

augroup in_block_insert
    au!
    au FileType cs au InsertLeave <buffer> unlet! b:in_block_insert
augroup END

" augroup omnisharp_commands
"     autocmd!
"     " Show type information automatically when the cursor stops moving.
"     autocmd CursorHold *.cs OmniSharpTypeLookup
" augroup END

if exists("g:AutoPairs")
    let b:AutoPairs = AutoPairsDefine({'\w\zs<' : '>'})
endif
