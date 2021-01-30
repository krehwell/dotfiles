" ----- VIM PLUG -----
call plug#begin('~/vim/plugged')
" ----- JAVACRIPT/TYPESCRIPT PLUG -----
Plug 'pangloss/vim-javascript'
Plug 'chemzqm/vim-jsx-improve'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'yuezk/vim-js'
call plug#end()


" let b:coc_root_patterns = ['.git', '.env']


" ----- SHOURTCUT -----
inoremap cll console.log();<esc>hi
