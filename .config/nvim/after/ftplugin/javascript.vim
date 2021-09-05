" ----- VIM PLUG -----
call plug#begin('~/vim/plugged')
" ----- JAVACRIPT PLUG -----
" Plug 'pangloss/vim-javascript'
Plug 'chemzqm/vim-jsx-improve'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'yuezk/vim-js'
call plug#end()


"----- KEYWORDS
function! HighlightAnnotations()
    syn keyword jsCommentTodo contained OVERVIEW NOTE IMPORTANT WARNING WHY REMEMBER
endfunction
autocmd Syntax * call HighlightAnnotations()


" ----- SHOURTCUT -----
inoremap cll console.log();<esc>hi
" nnoremap <leader>,exp :-1read $HOME/boilerplates/expressServer.js<CR>4j
" nnoremap <leader>,con :-1read $HOME/boilerplates/mongoConnect.js<CR>4j
