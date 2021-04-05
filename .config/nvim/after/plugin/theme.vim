" ----- THEME SETUP -----

" ----- NO COLOR ON LINE NUMBER -----
autocmd ColorScheme * highlight! link SignColumn LineNr

set background=dark
" use 256 color
set termguicolors

" ----- GRUVBOX ------
" let g:gruvbox_termcolors='256'
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_bold= '0'
let g:gitgutter_override_sign_column_highlight=1
colorscheme gruvbox
" ----- NO BG ON GIT HUNK -----
hi Normal guibg=NONE ctermbg=NONE


" ----- AYU -----
" let ayucolor="mirage"

