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


"   Vim folding commands (za -> toggle fold)
    " ---------------------------------
    " zf#j creates a fold from the cursor down # lines.
    " zf/ string creates a fold from the cursor to string .
    " zj moves the cursor to the next fold.
    " zk moves the cursor to the previous fold.
    " za toggle a fold at the cursor.
    " zo opens a fold at the cursor.
    " zO opens all folds at the cursor.
    " zc closes a fold under cursor.
    " zm increases the foldlevel by one.
    " zM closes all open folds.
    " zr decreases the foldlevel by one.
    " zR decreases the foldlevel to zero -- all folds will be open.
    " zd deletes the fold at the cursor.
    " zE deletes all folds.
    " [z move to start of open fold.
    " ]z move to end of open fold.
" ----- SWAG FOLD
function! MyFoldText()
    let line = getline(v:foldstart)
    let foldedlinecount = v:foldend - v:foldstart + 1
    return ' ⭐️ '. foldedlinecount . line
endfunction
set foldtext=MyFoldText()
set fillchars=fold:\
