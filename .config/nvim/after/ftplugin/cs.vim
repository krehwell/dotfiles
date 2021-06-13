" ----- GO TO REMAP -----
nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)
nmap <silent> <buffer> gi <Plug>(omnisharp_find_implementations)
nmap <silent> <buffer> gy <Plug>(omnisharp_preview_definition)

" ----- CODE ACTION REMAP -----
nmap <silent> <buffer> <Leader>ca :OmniSharpGetCodeActions<CR>
command! -nargs=0 Prettier :OmniSharpCodeFormat
