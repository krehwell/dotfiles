" ----- RELATIVE LINE NUMBERS ON NECESSSARY
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
augroup AutoCommetDisable
    autocmd!
    autocmd FileType * set formatoptions-=cro
augroup END


" ----- TRIM ANY TRAILING WHITESPACES ON SAVE | currently handled by conform.lua -----
" augroup TrimWhitespaceOnSave
"     autocmd!
"     autocmd BufWritePre * :call TrimWhitespace()
" augroup END
"
" fun! TrimWhitespace()
"     let l:save = winsaveview()
"     if &ft =~ 'txt\|markdown'
"         return
"     endif
"     keeppatterns %s/\s\+$//e
"     call winrestview(l:save)
" endfun


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


" ----- 'QUICK FIX' REMOVE SELECTED ITEM -----
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

