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
colorscheme off


" ----- BG CONFIG -----
" no color on line number
autocmd ColorScheme * highlight! link SignColumn LineNr
highlight CursorLineNr cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE


" ----- GIT GUTTER COLOR CONFIG
" Git Gutter remove bg color
let g:gitgutter_override_sign_column_highlight=1

" ----- Lighline color
autocmd VimEnter * call SetupLightlineColors()
function SetupLightlineColors() abort
  " transparent background in statusbar
  let l:palette = lightline#palette()
  let l:palette.normal.middle = [ [ '#444444', '#444444', '696969', '696969' ] ]
  let l:palette.inactive.middle = l:palette.normal.middle
  let l:palette.tabline.middle = l:palette.normal.middle
  call lightline#colorscheme()
endfunction


" " ----- LINE SPLITTER ------
" highlight VertSplit guibg=bg guifg=bg
set fillchars+=vert:┆


" ----- NO BG | PREFER NO BG FOR GRUVBOX AND ONDARK -----
hi Normal guibg=NONE ctermbg=NONE
