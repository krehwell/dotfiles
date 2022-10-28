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
Plug 'leafgarland/typescript-vim'
" Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }
call plug#end()


"----- KEYWORDS - highlight this keywords
function! HighlightAnnotations()
    syn keyword jsCommentTodo contained OVERVIEW NOTE IMPORTANT WARN WHY REMEMBER SUGGESTION BUG TEMP CAUTION
endfunction
autocmd Syntax * call HighlightAnnotations()


" ----- SHORTCUT -----
function! JumpToSummary()
  inoremap <C-[> <C-C>
  execute "norm! 02f\""
  execute "norm! ."
endfunction

function! WriteConsoleLog()
  inoremap <C-[> <esc>:call JumpToSummary()<CR>
  execute "norm! iconsole.log(\"\", )"
  execute "norm! =="
  :startinsert
endfunction

inoremap <silent> cll <esc>:call WriteConsoleLog()<CR>
