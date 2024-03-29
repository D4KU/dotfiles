" Set fzf.vim preview window postion dependent on window aspect ratio
function! fzf#smartpreview()
    let g:fzf_preview_window = [winwidth('%') / winheight('%') > 2 ? 'right' : 'up']
endfunction

" Slower but interactive version of fzf.vim's :Rg command
function! fzf#rg(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
