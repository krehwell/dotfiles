setlocal includeexpr=substitute(v:fname,'^@\/',getcwd().'/','')
setlocal isfname+=@-@

" ----- VIM PLUG -----
call plug#begin('~/vim/plugged')
" ----- JAVASCRIPT PLUG -----
" Plug 'pangloss/vim-javascript'
Plug 'chemzqm/vim-jsx-improve'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'yuezk/vim-js'
Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascript.jsx','typescript'],
  \ 'do': 'make install'
  \}
call plug#end()


"----- KEYWORDS - highlight this keywords
function! HighlightAnnotations()
    syn keyword jsCommentTodo contained OVERVIEW NOTE IMPORTANT WARN WHY REMEMBER SUGGESTION BUG TEMP CAUTION
endfunction
autocmd Syntax * call HighlightAnnotations()


" ----- SHORTCUT -----
inoremap cll console.log("", )<esc>hhhi
" nnoremap <leader>,exp :-1read $HOME/boilerplates/expressServer.js<CR>4j
" nnoremap <leader>,con :-1read $HOME/boilerplates/mongoConnect.js<CR>4j
