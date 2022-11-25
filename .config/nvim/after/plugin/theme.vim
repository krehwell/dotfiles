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
" autocmd ColorScheme * highlight! link SignColumn LineNr
" highlight CursorLineNr cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE


" ----- COC sign
highlight! link CocUnusedHighlight Comment
highlight! CocUnusedHighlight ctermfg=248 guifg=#595959
" CocErrorSign   xxx ctermfg=9 guifg=#ff0000
" CocWarningSign xxx ctermfg=130 guifg=#ff922b
" CocInfoSign    xxx ctermfg=11 guifg=#fab005
" CocHintSign    xxx ctermfg=12 guifg=#15aabf


" ----- LINE SPLITTER ------
" highlight VertSplit guibg=bg guifg=bg
hi VertSplit guibg=NONE guifg=NONE ctermbg=NONE ctermfg=NONE
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
