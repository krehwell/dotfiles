" ----- VIM PLUG -----
call plug#begin('~/vim/plugged')
" ----- JAVACRIPT PLUG -----
call plug#end()

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0
nnoremap <leader>f :GoFmt<CR>
