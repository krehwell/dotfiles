" ----- THEME SETUP -----

set background=dark
" ----- use 256 color -----
set termguicolors


" ----- BG CONFIG -----
" ----- no color on line number -----
autocmd ColorScheme * highlight! link SignColumn LineNr
" ---- git gutter remove bg color -----
let g:gitgutter_override_sign_column_highlight=1


" ----- GRUVBOX ------
syntax enable
" let g:gruvbox_termcolors='256'
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_bold= '0'
colorscheme gruvbox
" ----- no bg | prefer no bg for gruvbox -----
hi Normal guibg=NONE ctermbg=NONE



" ----- BASE 16 ONE DARK -----
" let base16colorspace=256
" colorscheme base16-onedark
" colorscheme onedark


" ----- AYU -----
" let ayucolor="mirage"


