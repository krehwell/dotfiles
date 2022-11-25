" ----- THEME SETUP -----
set background=dark
set termguicolors
command! -nargs=0 Colors :Telescope colorscheme


" ----- Gruvbox
let g:gruvbox_termcolors='256'
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_bold= '0'

" ----- OFF
let g:colors_off_a_little=1
let g:monochrome_italic_comments = 1
colorscheme off


" ----- BG CONFIG -----
" no color on line number
autocmd ColorScheme * highlight! link SignColumn LineNr
highlight CursorLineNr cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE
" highlight! link CocUnusedHighlight Comment
" highlight! CocUnusedHighlight ctermfg=7 ctermbg=242 guifg=LightGrey guibg=DarkGrey
highlight! CocUnusedHighlight ctermfg=248 guifg=#595959
hi VertSplit guibg=NONE guifg=NONE ctermbg=NONE ctermfg=NONE


" ----- GIT GUTTER COLOR CONFIG
" Git Gutter remove bg color
" let g:gitgutter_override_sign_column_highlight=1
" hi! GitGutterAdd guifg=#10A778 ctermfg=2
" hi! GitGutterChange guifg=#A89C14 ctermfg=3
" hi! GitGutterDelete guifg=#C30771 ctermfg=1
" hi! GitGutterChangeDelete guifg=#C30771 ctermfg=1


" ----- COC sign
" CocErrorSign   xxx ctermfg=9 guifg=#ff0000
" CocWarningSign xxx ctermfg=130 guifg=#ff922b
" CocInfoSign    xxx ctermfg=11 guifg=#fab005
" CocHintSign    xxx ctermfg=12 guifg=#15aabf


" ----- LINE SPLITTER ------
" highlight VertSplit guibg=bg guifg=bg
set fillchars+=vert:┆


" ----- LINE HIGHLIGHT -----
" define line highlight color
highlight LineHighlight ctermbg=darkgray guibg=black
" highlight the current line
nnoremap <silent> <localleader>h :call matchadd('LineHighlight', '\%'.line('.').'l')<CR>
" clear all the highlighted lines
nnoremap <silent> <localleader>H :call clearmatches()<CR>


" ----- NO BG | PREFER NO BG FOR GRUVBOX AND ONEDARK -----
hi Normal guibg=NONE ctermbg=NONE
