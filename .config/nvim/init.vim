"  syntax on
" ----- ONE STATUS -----
set laststatus=0
" set noruler
" au BufWrite * :OneStatus
set noshowcmd

" ----- AU BUFFER MEH ------
" autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
" autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" ----- WIN 10 SCREEN - BUF(at start) FIX -----
set t_ut=""
set t_u7=

" ----- ALL SET -----
" set ve+=onemore                                                     " enable to go to one more line
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab                    " own indenting
set backspace=indent,eol,start
set smartindent
set nu                                                                " number shows
set nowrap
set smartcase
set noswapfile                                                        " no swp file
set nobackup                                                          " no backup file
set undodir=~/.vim/undodir                                            " undotree dir
set undofile                                                          " to be able to save history of undo tree
set incsearch
" set backspace=2
set relativenumber
set path+=**                                                          " dir path search
set wildmenu                                                          " shows suggestion in tab :
set nocompatible                                                      " should be good for vim to act normal
set timeoutlen=500
set ttimeoutlen=0
set nobuflisted
set hidden        " coc ask me to do this
set signcolumn=no
" set cursorlineopt=number
" set cursorline
" set dir=/tmp      " vim .swp file handler
" nnoremap <esc><esc> :noh<return>

" ----- KEL FASTER TEST -----
" set ttyfast " scrolling fast they say

" ----- VIM PLUG ----- 
call plug#begin('~/vim/plugged')
" Plug 'leafgarland/typescript-vim'
" Plug 'vim-utils/vim-man'
" Plug 'lyuts/vim-rtags'
" Plug 'peitalin/vim-jsx-typescript'
" Plug 'preservim/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'ryanoasis/vim-devicons'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'mbbill/undotree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rstacruz/vim-closer'
Plug 'narajaon/onestatus'
Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript'
Plug 'chemzqm/vim-jsx-improve'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'}
call plug#end()

" ----- MOST LET HERE -----
let mapleader = " "
let g:netrw_browse_split=2
let g:netrw_banner = 0
let NERDTreeMinimalUI=1
let g:netrw_winsize=20

" ----- SEX SETTINGS -----
" lua vim.api.nvim_set_var("chadtree_settings", { use_icons = "emoji" })

" ----- FUZZY SEARCH -----
" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" let g:ctrlp_custom_ignore = {
"   \ 'dir':  '\.git$\|\.yardoc\|public$|log\|tmp$',
"   \ 'file': '\.so$\|\.dat$|\.DS_Store$'
"   \ }
" let g:ctrlp_use_caching=0
" nnoremap <C-f> :Ag<Cr>

" ----- LIGHTLINE SETTTINGS -----
let g:lightline = {'colorscheme': 'gruvbox'}

" ----- COC SETUP -----
" tab to scroll thru completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
command! -nargs=0 Prettier :CocCommand prettier.formatFile  " :Prettier to beutify
if has('nvim')                                              " Use <c-space> to trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
autocmd CursorHold * silent call CocActionAsync('highlight') " Highlight the symbol or match value by holding cursor
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" renaming file
nmap <f2> <Plug>(coc-rename)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" ----- THEME SETUP -----
" let g:gruvbox_termcolors='256'
let g:gruvbox_contrast_dark='hard'
set background=dark
" set termguicolors
colorscheme gruvbox

" ----- FUZZY SEARCH ACK AG -----
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" ----- SHORTCUT -----
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv <cmd>CHADopen <CR><cmd>-<CR>
nnoremap <silent> <Leader>- :vertical resize -10<CR>
nnoremap <silent> <Leader>= :vertical resize +10<CR>
nnoremap <silent> <Leader>0 :resize -3<CR>
nnoremap <silent> <Leader>9 :resize +3<CR>

" controlling vim-tab || C-Control
nnoremap <C-k> :tabprevious<CR>                                                      
nnoremap <C-j> :tabnext<CR>
nnoremap <F3> :set invpaste paste?<CR>
set pastetoggle=<F3>
set showmode

" boilerplates
nnoremap ,html :-1read $HOME/templates/.skeleton.html<CR>3j2wf>a
nnoremap ,exp :-1read $HOME/templates/.indexExpress.js<CR>4j
nnoremap ,com :-1read $HOME/templates/.comment.js<CR>2wa
iabbrev <// </<C-X><C-O>

" own meme templates
command! Memestonkface :r ~/templates/stonkface.txt
command! Memestonk :r ~/templates/stonk.txt
command! Memestonkbig :r ~/templates/stonk100.txt
command! Memeiknow :r ~/templates/iknow.txt
command! Memesadboy :r ~/templates/sadmemewojak.txt

" Buffer copy by meh
" copy
vmap <C-c> :w! ~/.vimbuffer<CR>
vmap <C-c> :.w! ~/.vimbuffer<CR>
noremap Y 0vg_y
" paste
map <C-m> :r ~/.vimbuffer<CR>
