" ----- FERN CONFIG -----

" disable warning on small screen
let g:fern_renderer_devicons_disable_warning = 1
let g:fern#renderer = "devicons"

" ----- NO NUMBER PLEASE ON FERN BUF -----
augroup fern-custom
    autocmd! *
    autocmd FileType fern setlocal nonu norelativenumber
    " Super cool trick to reopen fern and rewent to prev file
    au BufLeave * if &ft ==# 'fern' | nnoremap <silent> <Leader>pp :Fern . -drawer -reveal=% -width=27<CR> | endif
    au BufEnter * if &ft ==# 'fern' | nnoremap <silent> <Leader>pp <C-w><C-p> | endif
augroup END

" nnoremap <silent> <Leader>ee :<C-u>Fern <C-r>=<SID>smart_path()<CR><CR>

" Return a parent directory of the current buffer when the buffer is a file.
" Otherwise it returns a current working directory.
function! s:smart_path() abort
  if !empty(&buftype) || bufname('%') =~# '^[^:]\+://'
    return fnamemodify('.', ':p')
  endif
  return fnamemodify(expand('%'), ':p:h')
endfunction
