" Note: this is required for the plugin to work
filetype indent plugin on

" Use the stdio OmniSharp-roslyn server
let g:OmniSharp_server_stdio = 1

" If you have the .NET Framework installed in Windows, you may have better
" results using the Windows binaries.
let g:OmniSharp_server_path = '/mnt/c/omnisharp/OmniSharp.exe'
let g:OmniSharp_translate_cygwin_wsl = 1

" Set the type lookup function to use the preview window instead of echoing it
let g:OmniSharp_typeLookupInPreview = 1

" Timeout in seconds to wait for a response from the server
let g:OmniSharp_timeout = 5

" Don't autoselect first omnicomplete option, show options even if there is only
" one (so the preview documentation is accessible). Remove 'preview', 'popup'
" and 'popuphidden' if you don't want to see any documentation whatsoever.
" Note that neovim does not support `popuphidden` or `popup` yet: 
" https://github.com/neovim/neovim/issues/10996
" set completeopt=longest,menuone,preview,popuphidden

" Highlight the completion documentation popup background/foreground the same as
" the completion menu itself, for better readability with highlighted
" documentation.
" set completepopup=highlight:Pmenu,border:off

" Fetch full documentation during omnicomplete requests.
" By default, only Type/Method signatures are fetched. Full documentation can
" still be fetched when you need it with the :OmniSharpDocumentation command.
let g:omnicomplete_fetch_full_documentation = 1

" Set desired preview window height for viewing documentation.
" You might also want to look at the echodoc plugin.
set previewheight=5

" Update semantic highlighting on BufEnter, InsertLeave and TextChanged
let g:OmniSharp_highlight_types = 2

augroup omnisharp_commands
    autocmd!
    " Show type information automatically when the cursor stops moving.
    " Note that the type is echoed to the Vim command line, and will overwrite
    " any other messages in this space including e.g. ALE linting messages.
    autocmd CursorHold *.cs OmniSharpTypeLookup
augroup END

" Move inserted ; to the end of the line
inoremap <buffer> ; <end>;

" The following commands are contextual, based on the cursor position.
nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
nnoremap <buffer> <Leader>i :OmniSharpFindImplementations<CR>
nnoremap <buffer> <Leader>g :OmniSharpFindSymbol<CR>
nnoremap <buffer> <Leader>u :OmniSharpFindUsages<CR>

" Finds members in the current buffer
nnoremap <buffer> <Leader>m :OmniSharpFindMembers<CR>
nnoremap <buffer> <Leader>x :OmniSharpFixUsings<CR>
nnoremap <buffer> <Leader>? :OmniSharpTypeLookup<CR>
nnoremap <buffer> <F1> :OmniSharpDocumentation<CR>
nnoremap <buffer> <Leader>h :OmniSharpSignatureHelp<CR>
inoremap <buffer> <C-x><C-s> :OmniSharpSignatureHelp<CR>

" Find all code errors/warnings for the current solution and populate the quickfix window
nnoremap <buffer> <Leader>c :OmniSharpGlobalCodeCheck<CR>

" Navigate up and down by method/property/field
nnoremap <buffer> gk :OmniSharpNavigateUp<CR>
nnoremap <buffer> gj :OmniSharpNavigateDown<CR>

" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
nnoremap <buffer> <Leader><Space> :OmniSharpGetCodeActions<CR>

" Run code actions with text selected in visual mode to extract method
xnoremap <buffer> <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

" Rename with dialog
nnoremap <buffer> <F4> :OmniSharpRename<CR>

" Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
command! -nargs=1 Rnm :call OmniSharp#RenameTo("<args>")

nnoremap <buffer> <Leader>= :OmniSharpCodeFormat<CR>

" Start the omnisharp server for the current solution
nnoremap <buffer> <Leader>S :OmniSharpStartServer<CR>
nnoremap <buffer> <Leader>Z :OmniSharpStopServer<CR>

" Enable snippet completion
" let g:OmniSharp_want_snippet=1
