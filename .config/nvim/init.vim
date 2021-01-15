filetype plugin indent on
syntax on


" ========== Windows Area ==========
" ----- WIN 10 SCREEN - BUF(at start) FIX -----
set t_ut=""
set t_md=
set t_u7=


" ----- NOAUTOCOMMENT TO ALL FILES -----
augroup AutoCommetDisable
  autocmd!
  " autocmd BufEnter * silent! lcd %:p:h
  autocmd FileType * set formatoptions-=cro
augroup END


" ----- TRIM ANY TRAILING WHITESPACES -----
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup TrimWhitespaceOnSave
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END


" ----- MY VAR ------
nnoremap <localleader>i :vsplit $INIT<cr>
let $INIT="$HOME/.config/nvim/init.vim"


" ----- ALL SETs -----
" set cursorlineopt=number
" set autochdir                                                    " set the curr dir to opened buf
set backspace=2
set backspace=indent,eol,start
set colorcolumn=80
set hidden                                                         " coc ask me to do this
set ignorecase
set incsearch
set laststatus=2
set nobackup                                                       " no backup file
set nowritebackup
set nobuflisted
set nocompatible                                                   " should be good for vim to act normal
set noswapfile                                                     " no swp file
set nowrap
set nu                                                             " number shows
set path+=**                                                       " dir path search
set relativenumber
" set signcolumn=yes:1
set smartcase
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab autoindent smartindent       " own indenting
set title
set ttimeoutlen=0
set updatetime=300
set undodir=~/.vim/undodir                                         " undotree dir
set undofile                                                       " to be able to save history of undo tree
set wildmenu                                                       " shows suggestion in tab :
set noshowmode
set splitright
set splitbelow
autocmd ColorScheme * highlight! link SignColumn LineNr
nnoremap <F3> :set invpaste paste?<CR>
set pastetoggle=<F3>
set showmode


" ------ FOLDING ------
" Folding
set foldmethod=indent
" Don't fold anything by default - I'll close the folds myself
set foldlevel=99
" Don't bother folding small blocks
set foldminlines=5
" Autoclose folds when moving out of them
" set foldclose=all
" Fold column
set foldcolumn=0


" ----- VIM PLUG -----
call plug#begin('~/vim/plugged')
" -----
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" ----- FUZZY SEARCH PLUG -----
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'ctrlpvim/ctrlp.vim'
" ----- GIT PLUG -----
Plug 'lambdalisue/fern-git-status.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'rbong/vim-flog'
" ----- STATUS/HELPER -----
" Plug 'narajaon/onestatus'
Plug 'itchyny/lightline.vim'
Plug 'lambdalisue/fern.vim'
Plug 'mbbill/undotree'
Plug 'alvan/vim-closetag'
" ----- MOVEMENT/NAVIGATION PLUG -----
Plug 'Yggdroot/indentLine'
Plug 'mg979/vim-visual-multi'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
" ----- COLORSCHEME PLUG -----
Plug 'sheerun/vim-polyglot'
Plug 'morhetz/gruvbox'
Plug 'shaeinst/MonoAron'
Plug 'pineapplegiant/spaceduck'
Plug 'senran101604/neotrix.vim', {'branch': 'main'}
Plug 'Matsuuu/pinkmare', {'branch': 'main'}
Plug 'arthurealike/vim-J'
Plug 'antoinemadec/FixCursorHold.nvim'
call plug#end()


" ----- FIX CURSOR HOLD ----
let g:cursorhold_updatetime = 100


" ----- GIT -----
let g:gitgutter_map_keys=0                                         " prevent default key binding
set diffopt+=vertical
nmap [c <Plug>(GitGutterPrevHunk)
nmap ]c <Plug>(GitGutterNextHunk)
nnoremap gs :Gstatus<CR>


" ----- LIGHTLINE SETTTINGS -----
" let g:lightline = {'colorscheme': ''}


" ----- THEME SETUP -----
" let g:gruvbox_termcolors='256'
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_bold= '0'
set background=dark
set termguicolors
colorscheme gruvbox


" ----- LEADER KEY -----
let mapleader = " "
let maplocalleader = "\\"


" ----- SHORTCUT BASIC -----
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <silent> <Leader>pv :Fern . -drawer -reveal=% -width=27 -toggle<CR>
nnoremap <silent> <Leader>- :vertical resize -10<CR>
nnoremap <silent> <Leader>= :vertical resize +10<CR>
nnoremap <silent> <Leader>0 :resize -3<CR>
nnoremap <silent> <Leader>9 :resize +3<CR>
nnoremap <Leader>n :noh<CR>

" CONTROLLING VIM-TAB || C-CONTROL
nnoremap <C-k> :tabprevious<CR>
nnoremap <C-j> :tabnext<CR>

" MAPPING EDITING
inoremap <M-;> <esc>v$<esc>`>a;<esc>`<a
inoremap <c-b> <esc><right>dwi
inoremap <silent> jj <c-o>:call search('}\\|)\\|]\\|>\\|"', 'cW')<cr><Right>
inoremap {<CR> {<CR>}<Esc>O<BS><Tab>
nnoremap <M-j> ddp
nnoremap <M-k> ddkP
vnoremap w e

" SESSION BUFFER CONTROLLER
nnoremap <localleader>s :mksession! ~\vim_session<cr>
nnoremap <localleader>o :source ~\vim_session<cr>
nnoremap <localleader>a ggVG

iabbrev /* /*  */<esc>bhhi<del>

" ----- BOILERPLATES -----
nnoremap <leader>,html :-1read $HOME/boilerplates/skeleton.html<CR>3j2wf>a
" nnoremap ,com :-1read $HOME/templates/.comment.js<CR>2wa

" GLOBAL BUFFER COPY/PASTE
vnoremap <localleader>c :w! ~/.vimbufferz<CR>
vnoremap <localleader>c :.w! ~/.vimbufferz<CR>
nnoremap <localleader>v :r ~/.vimbufferz<CR>
" copy line without linebreak
nnoremap Y 0vg_y
