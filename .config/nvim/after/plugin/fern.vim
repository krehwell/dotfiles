" ----- FERN CONFIG -----

" disable warning on small screen
let g:fern_renderer_devicons_disable_warning = 1
let g:fern#renderer = "devicons"

function! s:init_fern() abort
  " Use 'select' instead of 'edit' for default 'open' action
  nmap <buffer> <Plug>(fern-action-open) <Plug>(fern-action-open:select)
endfunction

augroup fern-custom
  autocmd! *
  " no number please on fern buf
  autocmd FileType fern setlocal nonu norelativenumber
  " Super cool trick to reopen fern and rewent to prev file
  " au BufLeave * if &ft ==# 'fern' | nnoremap <silent> <Leader>pp :Fern . -drawer -reveal=% -width=27<CR> | endif
  " au BufEnter * if &ft ==# 'fern' | nnoremap <silent> <Leader>pp <C-w><C-p> | endif
augroup END

augroup fern-redraw
  autocmd! *
  autocmd BufWritePost * call feedkeys("\<Plug>(fern-action-redraw)")
  autocmd BufEnter * call feedkeys("\<Plug>(fern-action-redraw)")
augroup END
