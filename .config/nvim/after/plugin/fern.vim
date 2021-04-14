" ----- FERN CONFIG -----

" disable warning on small screen
let g:fern_renderer_devicons_disable_warning = 1
let g:fern#renderer = "devicons"

" ----- NO NUMBER PLEASE ON FERN BUF -----
augroup fern-custom
    autocmd! *
    autocmd FileType fern setlocal nonu
augroup END


