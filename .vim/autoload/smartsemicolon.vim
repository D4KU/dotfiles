" Insert semicolon at the line's end under certain conditions
" Return the string to insert at the cursor position
function! smartsemicolon#insert()
    let pos = getpos('.')
    let curLineNum = pos[1]
    let nextLineNum = curLineNum + 1
    let curLine = getline(curLineNum)
    let nextLine = getline(nextLineNum)
    let curLineInd = indent(curLineNum)
    let nextLineInd = indent(nextLineNum)
    let nextLineEmpty = nextLine =~ '^\s*$'

    if !s:CursorInComment()
                \ && pos[2] < col('$')
                \ && curLine =~ '[a-zA-Z0-9_)\]''"]\%[\(++\)]\%[\(--\)]\s*$'
                \ && nextLine !~ '{$'
                \ && (curLineInd >= nextLineInd || nextLineEmpty)
                \ && curLine !~ '^\s*for\s\?('
        try
            " Insert semicolon at the lines' end
            exec("normal! A;")
        catch
            " If insert mode can't be left, insert semicolon at
            " end without restoring original cursor position
            return "\<End>;"
        endtry
        " Restore original cursor position
        call setpos('.', pos)
        return ""
    endif
    return ";"
endfunction

" Returns if cursor is in a commented section
function! s:CursorInComment()
    let hg = join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'))
    return hg =~? 'comment' ? 1 : 0
endfunction

