" ----- RELOAD FILE WHEN REFOCUS
augroup reload_file_on_focus
    autocmd!
    autocmd BufEnter,FocusGained,WinEnter * checktime
augroup END


" ----- RELATIVE LINE NUMBERS ON NECESSARY
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,WinLeave   * if &nu                  | set nornu | endif
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

function! TabLabel(n)
    let wincount = tabpagewinnr(a:n, '$')
    let winnr = tabpagewinnr(a:n)

    let bufnr = tabpagebuflist(a:n)[winnr - 1]
    let bufname = bufname(bufnr)
    let bufmodified = getbufvar(bufnr, '&mod') == 1 ? '+' : ''
    let dirname = fnamemodify(bufname, ':p:h:t')
    let filename = fnamemodify(bufname, ':t')
    let window_info = wincount > 1 ? '['.wincount.']' : ''
    return ' ' . a:n . ':' . dirname . '/' . filename . window_info . bufmodified
endfunction


" ----- NOAUTOCOMMENT TO ALL FILES -----
augroup AutoCommentDisable
    autocmd!
    autocmd FileType * set formatoptions-=cro
augroup END


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


" ----- HIGHLIGHT ON YANK
lua << EOF
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local yank_group = augroup('HighlightYank', {})
autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})
EOF


" ----- GO TO LAST LOCATION WHEN OPENING A BUFFER
lua << EOF
vim.api.nvim_create_autocmd('BufReadPost', {
    group = vim.api.nvim_create_augroup('krehwell/last_location', { clear = true }),
    desc = 'Go to the last location when opening a buffer',
    callback = function(args)
        local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
        local line_count = vim.api.nvim_buf_line_count(args.buf)
        if mark[1] > 0 and mark[1] <= line_count then
            vim.cmd 'normal! g`"zz'
        end
    end,
})
EOF
