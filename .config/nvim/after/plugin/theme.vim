" ----- THEME SETUP -----
set background=dark
set termguicolors


" Base 16 OneDark
" let base16colorspace=256
" colorscheme base16-onedark
" colorscheme onedark

" Ayu
" let ayucolor="mirage"

" Gruvbox
let g:gruvbox_termcolors='256'
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_bold= '0'

" OFF
colorscheme off


" ----- BG CONFIG -----
" no color on line number
autocmd ColorScheme * highlight! link SignColumn LineNr
highlight CursorLineNr cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE


" ----- GIT GUTTER COLOR CONFIG -----
" git gutter remove bg color
let g:gitgutter_override_sign_column_highlight=1

highlight GitGutterAdd    guifg=#10A778 ctermfg=2
highlight GitGutterChange guifg=#A89C14 ctermfg=3
highlight GitGutterDelete guifg=#C30771 ctermfg=1

hi! GitGutterAdd guifg=#10A778 ctermfg=2
hi! GitGutterChange guifg=#A89C14 ctermfg=3
hi! GitGutterDelete guifg=#C30771 ctermfg=1
hi! GitGutterChangeDelete guifg=#C30771 ctermfg=1


" " ----- LINE SPLITTER ------
" highlight VertSplit guibg=bg guifg=bg
set fillchars+=vert:┆


" ----- NO BG | PREFER NO BG FOR GRUVBOX AND ONDARK -----
hi Normal guibg=NONE ctermbg=NONE

