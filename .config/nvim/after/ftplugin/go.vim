" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0
let g:go_doc_keywordprg_enabled = 0
let g:go_doc_popup_window = 1
let g:go_doc_balloon = 1
" let g:go_def_mode='gopls'
" let g:go_info_mode='gopls'
nnoremap <leader>f :GoFmt<CR>