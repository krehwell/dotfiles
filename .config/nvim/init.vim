filetype plugin indent on
syntax on


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


" ----- CONVERT 4 SPACES TO 2 SPACES -----
fun! Four2Two() range
    set expandtab
    set shiftwidth=4
    retab
    '<,'>normal! ==
    '<,'>s;^\(\s\+\);\=repeat(' ', len(submatch(0))/2);g
    set shiftwidth=4
    norm!gv>
endfun


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
if exists('$TMUX')
    set laststatus=0
endif
set nobackup                                                       " no backup file
set nowritebackup
set nobuflisted
set nocompatible                                                   " should be good for vim to act normal
set noswapfile                                                     " no swp file
set nowrap
set nu                                                             " number shows
" set relativenumber
set path+=**                                                       " dir path search
" set signcolumn=yes:1
set smartcase
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab autoindent smartindent       " own indenting
set title
set ttimeoutlen=0
set updatetime=100
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
set scrolloff=5


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
Plug 'tpope/vim-fugitive'
" Plug 'airblade/vim-gitgutter'
Plug 'rbong/vim-flog'
" ----- STATUS/HELPER -----
" Plug 'narajaon/onestatus'
Plug 'itchyny/lightline.vim'
Plug 'mbbill/undotree'
Plug 'vimpostor/vim-tpipeline'
" ----- DIR TREE -----
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/fern.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'lambdalisue/fern-renderer-devicons.vim'
Plug 'lambdalisue/fern-hijack.vim'
" ----- MOVEMENT/NAVIGATION PLUG -----
" Plug 'Yggdroot/indentLine'
Plug 'mg979/vim-visual-multi'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'
" ----- COLORSCHEME PLUG -----
Plug 'sheerun/vim-polyglot'
Plug 'morhetz/gruvbox'
Plug 'senran101604/neotrix.vim', {'branch': 'main'}
Plug 'ayu-theme/ayu-vim'
call plug#end()


" ----- FIX CURSOR HOLD ----
let g:cursorhold_updatetime = 100


" ----- LET CLOSETAG ON REACT FILE -----
let g:closetag_filenames = '*.js, *.jsx, *.tsx'
" ----- `<Link>` will be closed while `<link>` won't -----
let g:closetag_emptyTags_caseSensitive = 1


" ----- LIGHTLINE SETTTINGS -----
" let g:lightline = {'colorscheme': 'argonaut'}
" 'right': [ [ 'lineinfo' ], ['percent'], ['filetype']]
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'filename', 'modified' ] ],
      \   'right': []
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ }
      \ }


" ----- FERN CONFIG -----
let g:fern#renderer = "devicons"
augroup fern-custom
  autocmd! *
  autocmd FileType fern setlocal nonu
augroup END


" ----- THEME SETUP -----
" let g:gruvbox_termcolors='256'
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_bold= '0'
set background=dark
" let ayucolor="mirage"
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
nnoremap <leader>u :UndotreeToggle<CR>:UndotreeFocus<CR>
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

" CD TO CURRENT BUFFER's DIR | lcd -> for cding the current buffer only to the current dir
nnoremap <localleader>cd :cd %:p:h
nnoremap <localleader>lcd :lcd %:p:h

iabbrev /* /*  */<esc>bhhi<del>

" ----- BOILERPLATES -----
nnoremap <leader>,html :-1read $HOME/boilerplates/skeleton.html<CR>3j2wf>a

" ----- LINE HIGHLIGHT -----
" define line highlight color
highlight LineHighlight ctermbg=darkgray guibg=black
" highlight the current line
nnoremap <silent> <localleader>h :call matchadd('LineHighlight', '\%'.line('.').'l')<CR>
" clear all the highlighted lines
nnoremap <silent> <localleader>H :call clearmatches()<CR>

" GLOBAL BUFFER COPY/PASTE
vnoremap <localleader>c :w! ~/.vimbufferz<CR>
vnoremap <localleader>c :.w! ~/.vimbufferz<CR>
nnoremap <localleader>v :r ~/.vimbufferz<CR>
" copy line without linebreak
nnoremap Y 0vg_y
