" ----- COLORSCHEME -----
let g:neotrix_dark_contrast = "retro"
" colorscheme neotrix


" ----- ERROR HIGHLIGHTING -----
" hi! CocErrorSign guifg=#d1666a
" hi! CocInfoSign guibg=#353b45
" hi! CocWarningSign guifg=#d1666a


" ----- VIM PLUG -----
call plug#begin('~/vim/plugged')
" ----- JAVACRIPT PLUG -----
Plug 'pangloss/vim-javascript'
Plug 'chemzqm/vim-jsx-improve'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'yuezk/vim-js'
call plug#end()


" ----- CLOSE TAG -----
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx, *.js'


" ----- SHOURTCUT -----
inoremap cll console.log();<esc>hi
nnoremap <leader>,exp :-1read $HOME/boilerplates/expressServer.js<CR>4j
nnoremap <leader>,con :-1read $HOME/boilerplates/mongoConnect.js<CR>4j
