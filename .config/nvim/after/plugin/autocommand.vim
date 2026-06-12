" ----- RELOAD FILE WHEN REFOCUS
augroup reload_file_on_focus
    autocmd!
    autocmd BufEnter,FocusGained,WinEnter * checktime
augroup END


" ----- TAB NAMING
set tabline=%!TabLine()

function! TabLine()
    let line = ''
    for i in range(tabpagenr('$'))
        let line .= (i+1 == tabpagenr()) ? '%#TabLineSel#' : '%#TabLine#'
        let line .= '%' . (i + 1) . 'T'
        let line .= TabLabel(i + 1) . ' '
    endfor
    let line .= '%#TabLineFill#%T'
    return line
endfunction

function! s:TabNormalWins(n)
    let l:wins = []
    for l:w in range(1, tabpagewinnr(a:n, '$'))
        let l:winid = win_getid(l:w, a:n)
        if nvim_win_get_config(l:winid).relative !=# ''
            continue
        endif
        if getbufvar(winbufnr(l:winid), '&buftype') !=# ''
            continue
        endif
        call add(l:wins, l:winid)
    endfor
    return l:wins
endfunction

function! TabLabel(n)
    let l:wins = s:TabNormalWins(a:n)
    let l:wincount = len(l:wins)

    " Prefer the active window's buffer, but only if it's a real editing
    " window; otherwise fall back to the first real one, then to whatever the
    " active window holds (e.g. a tab showing only a file tree).
    let l:activewin = win_getid(tabpagewinnr(a:n), a:n)
    if index(l:wins, l:activewin) >= 0
        let l:bufnr = winbufnr(l:activewin)
    elseif l:wincount > 0
        let l:bufnr = winbufnr(l:wins[0])
    else
        let l:bufnr = tabpagebuflist(a:n)[tabpagewinnr(a:n) - 1]
    endif

    let l:bufname = bufname(l:bufnr)
    let l:bufmodified = getbufvar(l:bufnr, '&mod') == 1 ? '+' : ''
    let l:dirname = fnamemodify(l:bufname, ':p:h:t')
    let l:filename = fnamemodify(l:bufname, ':t')
    let l:window_info = l:wincount > 1 ? '['.l:wincount.']' : ''
    return ' ' . a:n . ':' . l:dirname . '/' . l:filename . l:window_info . l:bufmodified
endfunction


" ----- DELETE BUFFER EXCEPT THE ONEs OPENED ON WINDOWS OR TABS -----
function! WipeoutInactiveBufs()
    " Get the buffer number of the alternate file in the current window
    let l:alternate_buf = bufnr('#')
    
    " Filter for buffers that are:
    " 1. Hidden (not visible in any window)
    " 2. Not modified (unsaved changes)
    " 3. Not the current alternate file
    let l:inactive_bufs = filter(getbufinfo(), {idx, val -> 
        \ val.hidden && 
        \ !val.changed && 
        \ val.bufnr != l:alternate_buf
        \ })
    
    let l:nWipeouts = 0
    for l:buf in l:inactive_bufs
        execute 'bwipeout' l:buf.bufnr
        let l:nWipeouts += 1
    endfor

    echomsg l:nWipeouts . ' buffer(s) wiped out (preserved alternate)'
endfunction
command! -nargs=0 LsWipeInactive :call WipeoutInactiveBufs()
command! -nargs=0 LswipeInactive :call WipeoutInactiveBufs()
command! -nargs=0 LSWipeInactive :call WipeoutInactiveBufs()
command! -nargs=0 LSwipeInactive :call WipeoutInactiveBufs()


" ----- 'QUICK FIX' REMOVE SELECTED ITEM WITH 'dd' -----
function! RemoveQFItem()
    let curqfidx = line('.') - 1
    let qfall = getqflist()
    call remove(qfall, curqfidx)
    call setqflist(qfall, 'r')
    execute curqfidx + 1 . "cfirst"
    " :copen
endfunction
:command! RemoveQFItem :call RemoveQFItem()
" Use map <buffer> to only map dd in the quickfix window. Requires +localmap
autocmd FileType qf map <buffer> dd :RemoveQFItem<cr>


" ----- GO TO LAST LOCATION WHEN OPENING A BUFFER
augroup last_location
    autocmd!
    autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe 'normal! g`"zz' | endif
augroup END
