" ----- FERN CONFIG -----

" function! s:init_fern() abort
"     " Use 'select' instead of 'edit' for default 'open' action
"     nmap <buffer> <Plug>(fern-action-open) <Plug>(fern-action-open:select)
" endfunction

function! s:closeFernWithNoWait()
    nnoremap <buffer> <silent> <Plug>(my-fern-toggle) :Fern . -drawer -reveal=% -width=27 -toggle<CR>
    nnoremap <buffer> <c-b> <Plug>(my-fern-toggle)<Plug>(fern-action-zoom:reset)<Plug>(fern-action-hidden:set)
endfunction

augroup fern-custom
    autocmd! *
    autocmd FileType fern setlocal nonu norelativenumber " no number on fern buf, please
    " autocmd FileType fern call s:closeFernWithNoWait()
    autocmd BufWritePost * call feedkeys("\<Plug>(fern-action-redraw)")
augroup END

" default fern mapping
nnoremap <silent> <Plug>(my-fern-toggle) :Fern . -drawer -reveal=% -width=27 -toggle<CR>
nnoremap <c-b> <Plug>(my-fern-toggle)<Plug>(fern-action-zoom:reset)<Plug>(fern-action-hidden:set)
