" ----- NOAUTOMOVESCREEN ON SWITCH BUFFER -----
" Save current view settings on a per-window, per-buffer basis.
" function! AutoSaveWinView()
"     if !exists("w:SavedBufView")
"         let w:SavedBufView = {}
"     endif
"     let w:SavedBufView[bufnr("%")] = winsaveview()
" endfunction
"
" " Restore current view settings.
" function! AutoRestoreWinView()
"     let buf = bufnr("%")
"     if exists("w:SavedBufView") && has_key(w:SavedBufView, buf)
"         let v = winsaveview()
"         let atStartOfFile = v.lnum == 1 && v.col == 0
"         if atStartOfFile && !&diff
"             call winrestview(w:SavedBufView[buf])
"         endif
"         unlet w:SavedBufView[buf]
"     endif
" endfunction
"
" " When switching buffers, preserve window view.
" if v:version >= 700
"     autocmd BufLeave * call AutoSaveWinView()
"     autocmd BufEnter * call AutoRestoreWinView()
" endif


" ----- TAB NAMING
function! TabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let currentBuffPath = bufname(buflist[winnr - 1])
  return fnamemodify(currentBuffPath, ":h:t") . "/" . fnamemodify(currentBuffPath, ":t")
endfunction

function! TabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif
    let s .= ' %{TabLabel(' . (i + 1) . ')} '
  endfor
  let s .= '%#TabLineFill#%T'
  return s
endfunction
set tabline=%!TabLine()


" ----- NOAUTOCOMMENT TO ALL FILES -----
augroup AutoCommetDisable
    autocmd!
    autocmd FileType * set formatoptions-=cro
augroup END


" ----- TRIM ANY TRAILING WHITESPACES ON SAVE -----
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


" ----- DELETE BUFFER EXCEPT THE ONEs OPENED ON WINDOWS OR TABS -----
function! WipeoutInactiveBufs()
    "From tabpagebuflist() help, get a list of all buffers in all tabs
    let tablist = []
    for i in range(tabpagenr('$'))
        call extend(tablist, tabpagebuflist(i + 1))
    endfor

    "Below originally inspired by Hara Krishna Dara and Keith Roberts
    "http://tech.groups.yahoo.com/group/vim/message/56425
    let nWipeouts = 0
    for i in range(1, bufnr('$'))
        if bufexists(i) && !getbufvar(i,"&mod") && index(tablist, i) == -1
        "bufno exists AND isn't modified AND isn't in the list of buffers open in windows and tabs
            silent exec 'bwipeout' i
            let nWipeouts = nWipeouts + 1
        endif
    endfor
    echomsg nWipeouts . ' buffer(s) wiped out'
endfunction
command! -nargs=0 LsWipeInactive :call WipeoutInactiveBufs()
command! -nargs=0 LswipeInactive :call WipeoutInactiveBufs()
command! -nargs=0 LSWipeInactive :call WipeoutInactiveBufs()
command! -nargs=0 LSwipeInactive :call WipeoutInactiveBufs()


" ----- "QUICK FIX" REMOVE SELECTED ITEM -----
function! RemoveQFItem()
    let curqfidx = line('.') - 1
    let qfall = getqflist()
    call remove(qfall, curqfidx)
    call setqflist(qfall, 'r')
    execute curqfidx + 1 . "cfirst"
    :copen
endfunction
:command! RemoveQFItem :call RemoveQFItem()
" Use map <buffer> to only map dd in the quickfix window. Requires +localmap
autocmd FileType qf map <buffer> dd :RemoveQFItem<cr>
