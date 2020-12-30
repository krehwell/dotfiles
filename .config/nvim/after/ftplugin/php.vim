" ----- COLORSCHEME -----
colorscheme gruvbox


" ----- REMOVE AUTO COMMENT -----
augroup UnAutoComment
  autocmd!
  autocmd bufenter *.php :set formatoptions=qctnj1
augroup END


" ----- VIM PLUG ----- 
call plug#begin('~/vim/plugged')
Plug 'shawncplus/phpcomplete.vim'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'stephpy/vim-php-cs-fixer'
" Plug 'phpactor/phpactor', {'for': 'php', 'branch': 'master', 'do': 'composer install --no-dev -o'}
call plug#end()


" ----- SHOURTCUT -----
inoremap ecc echo " <br/>";<esc>3bhi
