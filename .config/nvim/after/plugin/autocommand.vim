" ----- NOAUTOMOVESCREEN ON SWITCH BUFFER -----
" Save current view settings on a per-window, per-buffer basis.
function! AutoSaveWinView()
    if !exists("w:SavedBufView")
        let w:SavedBufView = {}
    endif
    let w:SavedBufView[bufnr("%")] = winsaveview()
endfunction

" Restore current view settings.
function! AutoRestoreWinView()
    let buf = bufnr("%")
    if exists("w:SavedBufView") && has_key(w:SavedBufView, buf)
        let v = winsaveview()
        let atStartOfFile = v.lnum == 1 && v.col == 0
        if atStartOfFile && !&diff
            call winrestview(w:SavedBufView[buf])
        endif
        unlet w:SavedBufView[buf]
    endif
endfunction

" When switching buffers, preserve window view.
if v:version >= 700
    autocmd BufLeave * call AutoSaveWinView()
    autocmd BufEnter * call AutoRestoreWinView()
endif


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


" ----- SHOW STATUS LINE WHEN GIT DIFF EVEN WHEN TMUX ON -----
fun! StatusLineOnGitDiff()
    if exists('$TMUX') && &diff == 0
        set laststatus=0                                               " no statusline when tmux in
    elseif &diff
        set laststatus=2
    elseif exists('$TMUX')
        set laststatus=0                                               " no statusline when tmux in
    endif
endfun

" Last status checker on vim diff
augroup DiffStatusLineAction
    autocmd!
    autocmd BufEnter * :call StatusLineOnGitDiff()
augroup END
