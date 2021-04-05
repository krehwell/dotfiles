" ----- NOAUTOCOMMENT TO ALL FILES -----
augroup AutoCommetDisable
  autocmd!
  " autocmd BufEnter * silent! lcd %:p:h
  autocmd FileType * set formatoptions-=cro
augroup END


" ----- TRIM ANY TRAILING WHITESPACES -----
augroup TrimWhitespaceOnSave
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

fun! TrimWhitespace()
    let l:save = winsaveview()
    if &ft =~ 'txt\|markdown'
        return
    endif
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun


" ----- CONVERT 4 SPACES TO 2 SPACES -----
fun! Four2Two() range
    set expandtab
    set shiftwidth=4
    retab
    '<,'>normal! ==
    '<,'>s;^\(\s\+\);\=repeat(' ', len(submatch(0))/2);g
    set shiftwidth=4
    norm!gv>
endfun


