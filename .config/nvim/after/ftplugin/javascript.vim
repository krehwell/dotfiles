" cspell:disable
function! SubPathsWithDots()
  let pathFromRootStr = expand('%:h')
  let pathToDotsStr = substitute(expand('%:h'), '\w\+', "..", "g")
  echo pathFromRootStr
  return pathToDotsStr . '/'
endfunction
setlocal includeexpr=substitute(v:fname,'^@\/',SubCurrPathWithDots(),'')
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
function! JumpToSummary()
  inoremap <C-[> <C-C>
  execute "norm! `[v`.y"
  execute "norm! 02f\""
  execute "norm! P"
endfunction

function! WriteConsoleLog()
  inoremap <C-[> <esc>:call JumpToSummary()<CR>
  execute "norm! iconsole.log(\"\", )"
  execute "norm! ==0"
  call searchpos(")")
  call feedkeys("i")
endfunction

inoremap <silent> cll <esc>:call WriteConsoleLog()<CR>
" nnoremap <leader>,exp :-1read $HOME/boilerplates/expressServer.js<CR>4j
" nnoremap <leader>,con :-1read $HOME/boilerplates/mongoConnect.js<CR>4j
