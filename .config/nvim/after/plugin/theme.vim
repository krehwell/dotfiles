" ----- THEME SETUP -----

set background=dark
" ----- USE 256 COLOR -----
set termguicolors


" ----- BG CONFIG -----
" ----- NO COLOR ON LINE NUMBER -----
autocmd ColorScheme * highlight! link SignColumn LineNr
" ---- git gutter remove bg color -----
let g:gitgutter_override_sign_column_highlight=1


" ----- GRUVBOX ------
" ----- SYNTAX ENABLE -----
" " let g:gruvbox_termcolors='256'
" let g:gruvbox_contrast_dark='hard'
" let g:gruvbox_bold= '0'
" colorscheme gruvbox


" ----- BASE 16 ONE DARK -----
" let base16colorspace=256
" colorscheme base16-onedark
colorscheme onedark
" ----- LINE SPLITTER ------
highlight VertSplit guibg=bg guifg=bg
set fillchars+=vert:┆


" ----- AYU -----
" let ayucolor="mirage"


" ----- NO BG | PREFER NO BG FOR GRUVBOX AND ONDARK -----
hi Normal guibg=NONE ctermbg=NONE

