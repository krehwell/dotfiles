filetype plugin indent on
syntax on


" ----- CUSTOM LOCAL VAR ------
nnoremap <localleader>i :vsplit $INIT<cr>
let $INIT="~/.config/nvim/init.vim"


" ----- CUSTOM ALE FLAG -----
" let g:ale_disable_lsp = 1    " disable ale, we set 'diagnostic.displayByAle' to coc instead
" let g:ale_set_highlights = 0
" let g:ale_set_signs = 0


" ----- ALL SETs -----
" set cursorlineopt=number
" set autochdir                                                    " set the curr dir to opened buf
set exrc                                                           " allow local init.vim
set backspace=2
set backspace=indent,eol,start
set colorcolumn=120
set hidden                                                         " coc ask me to do this
set ignorecase
set incsearch
if exists('$TMUX')
    set laststatus=0                                               " no statusline when tmux in
endif
set nobackup                                                       " no backup file
set nowritebackup
set nobuflisted
set nocompatible                                                   " should be good for vim to act normal
set noswapfile                                                     " no swp file
set nowrap
set nu                                                             " number shows
set relativenumber
set path+=**                                                       " dir path search
set signcolumn=yes:1
set smartcase
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab autoindent smartindent       " own indenting
set title
set ttimeoutlen=0
set updatetime=10
set undodir=~/.vim/undodir                                         " undotree dir
set undofile                                                       " to be able to save history of undo tree
set wildmenu                                                       " shows suggestion in :
set noshowmode
set splitright
set splitbelow
nnoremap <F3> :set invpaste paste?<CR>
set pastetoggle=<F3>
set showmode
set scrolloff=5
set shortmess+=F
set mouse-=anc
set eadirection=ver
set noequalalways


" ----- FIX SLUGGIST CURSOR HOLD ----
let g:cursorhold_updatetime = 100


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


" spell:disable
" ----- VIM PLUG -----
call plug#begin('~/vim/plugged')
" ----- LSP
" Plug 'fatih/vim-go' " for some reason, this lsp can't be in ftplugin/go.vim
" Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" ----- FUZZY SEARCH PLUG
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
" ----- GIT PLUG
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" Plug 'mhinz/vim-signify'
" Plug 'rbong/vim-flog'
" ----- STATUS/HELPER
Plug 'vimpostor/vim-tpipeline'
" Plug 'vim-airline/vim-airline'
Plug 'itchyny/lightline.vim'
Plug 'mbbill/undotree'
" ----- DIR TREE
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/fern.vim'
" Plug 'ryanoasis/vim-devicons' " - fern used this
" Plug 'lambdalisue/fern-renderer-devicons.vim' " - fern used this
Plug 'lambdalisue/fern-hijack.vim'
Plug 'kyazdani42/nvim-web-devicons'
" ----- MOVEMENT/NAVIGATION PLUG
Plug 'mg979/vim-visual-multi'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'alvan/vim-closetag'
Plug 'isomoar/vim-css-to-inline' " for some reason, this lsp can't be in ftplugin/javascript.vim
" Plug 'airblade/vim-current-search-match'
" Plug 'AndrewRadev/switch.vim'
" Plug 'Yggdroot/indentLine'
" Plug 'wfxr/minimap.vim'
" ----- VIM CORE HELPER -----
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'ojroques/vim-oscyank', {'branch': 'main'}
" ----- COLORSCHEME PLUG
Plug 'sheerun/vim-polyglot'
Plug 'fxn/vim-monochrome'
Plug 'morhetz/gruvbox'
Plug 'pbrisbin/vim-colors-off'
call plug#end()
" spell:enable


" ----- START OF - FOR SOME REASON THIS CONFIG SHOULD BE HERE

" CLOSETAG THINGS - let closetag on react file -----
let g:closetag_filenames = '*.js, *.jsx, *.tsx'
" `<Link>` will be closed while `<link>` won't -----
let g:closetag_emptyTags_caseSensitive = 1

" FERN THINGS - disable warning on small screen
let g:fern_renderer_devicons_disable_warning = 1
let g:fern#renderer = "devicons"

" ------ END OF - FOR SOME REASON THIS CONFIG SHOULD BE HERE


" ----- POLYGOT CONFIGURATION
let g:polyglot_disabled = ['autoindent']


" ------ TMUX STATUS LINE
let g:tpipeline_autoembed = 0
" tpipeline comes bundled with its own custom minimal statusline seen above
" let g:tpipeline_statusline = '%!tpipeline#stl#airline()'
" let g:tpipeline_statusline = '%f'
" You can also use standard statusline syntax, see :help stl
let g:tpipeline_cursormoved = 1


" ----- VIM-TOGGLE MAP
" let g:switch_mapping = "+


" ----- LEADER KEY -----
let mapleader = " "
let maplocalleader = "\\"


" ----- MAPPING KEYS -----
" ----- SHORTCUT BASIC
nnoremap <leader>u :UndotreeToggle<CR>:UndotreeFocus<CR>
nnoremap <silent> <Plug>(my-fern-toggle) :Fern . -drawer -reveal=% -width=27 -toggle<CR>
nnoremap <c-b> <Plug>(my-fern-toggle)<Plug>(fern-action-zoom:reset)
nnoremap <silent> <Leader>pr :Fern . -drawer -reveal=% -width=27 -toggle<CR>:Fern . -drawer -reveal=% -width=27 -toggle<CR><C-w><C-p>
nnoremap <silent> <Leader>- :vertical resize -15<CR>
nnoremap <silent> <Leader>= :vertical resize +15<CR>
nnoremap <silent> <Leader>9 :resize -3<CR>
nnoremap <silent> <Leader>8 :resize +3<CR>
nnoremap <silent><esc> <esc>:noh<CR><esc>

" ----- TAB SWITCHER
nnoremap <c-w><c-k> :tabprevious<CR>
nnoremap <c-w><c-j> :tabnext<CR>

" ----- EDITING
iabbrev /* /*  */<esc>bhhi<del>
inoremap <M-;> <esc>v$<esc>`>a;<esc>`<a
inoremap <c-b> <esc><right>dwi
inoremap <silent> jj <c-o>:call search('}\\|)\\|]\\|>\\|"', 'cW')<cr><Right>
nnoremap <M-j> ddp
nnoremap <M-k> ddkP
nnoremap <leader>sr :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>
nnoremap <localleader>a ggVG
vnoremap b B
vnoremap $ $<left>
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '>-2<CR>gv=gv
vnoremap w e
" commenting block with /* code */
vnoremap <C-K>c c/* <C-R>" */<Esc>


" ----- CALCULATOR
nnoremap Q 0yt=A<C-r>=<C-r>"<CR><Esc>

" ----- SESSION BUFFER CONTROLLER
nnoremap <localleader>b :bprevious<CR>
nnoremap <localleader>n :bnext<CR>
nnoremap <localleader>o :source ~\vim_session<cr>
nnoremap <localleader>s :mksession! ~\vim_session<cr>
" cnoremap b# b#\|bd

" ----- CD TO CURRENT BUFFER's DIR | lcd -> for cding the current buffer only to the current dir
nnoremap <localleader>cd :cd %:p:h<CR>
nnoremap <localleader>lcd :lcd %:p:h<CR>


" ----- BOILERPLATES -----
nnoremap <leader>,html :-1read $HOME/boilerplates/skeleton.html<CR>3j2wf>a


" ----- RE-EXECUTE NECESSARY FILE WHILE SOURCE % { THEME } -----
" MAKE SURE THIS ALWAYS IN THE END
let g:vim_home = get(g:, 'vim_home', expand('~/.config/nvim/'))

" Re-Load all necessary vim configs
let config_list = [
            \ 'after/plugin/theme.vim',
            \]

for files in config_list
    for f in glob(g:vim_home.files, 1, 1)
        exec 'source' f
    endfor
endfor


" ----- ENABLING 'exrc' | local .nvimrc -----
set secure


" ----- LUA SOURCE -----
lua require("telescope-config")
