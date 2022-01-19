" Set fzf.vim preview window postion dependent on window aspect ratio
function! fzf#smartpreview()
    let l:ratio = winwidth('%') / (1.0 * winheight('%'))
    let l:side = l:ratio > 2 ? 'right' : 'up'
    let g:fzf_preview_window = [l:side . ':50%', 'ctrl-/']
endfunction

" Slower but interactive version of fzf.vim's :Rg command
function! fzf#rg(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
