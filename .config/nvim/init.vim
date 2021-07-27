filetype plugin indent on
syntax on


" ----- CUSTOM LOCAL VAR ------
nnoremap <localleader>i :vsplit $INIT<cr>
let $INIT="~/.config/nvim/init.vim"


" ----- ALL SETs -----
" set cursorlineopt=number
" set autochdir                                                    " set the curr dir to opened buf
set exrc                                                           " allow local init.vim
set backspace=2
set backspace=indent,eol,start
set colorcolumn=80
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
" set signcolumn=yes:1
set smartcase
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab autoindent smartindent       " own indenting
set title
set ttimeoutlen=0
set updatetime=10
set undodir=~/.vim/undodir                                         " undotree dir
set undofile                                                       " to be able to save history of undo tree
set wildmenu                                                       " shows suggestion in tab :
set noshowmode
set splitright
set splitbelow
nnoremap <F3> :set invpaste paste?<CR>
set pastetoggle=<F3>
set showmode
set scrolloff=5
set shortmess+=F
set mouse=nc
set eadirection=ver
" set noequalalways


" ----- FIX CURSOR HOLD ----
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


" ----- VIM PLUG -----
call plug#begin('~/vim/plugged')
" ----- LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'folke/lsp-colors.nvim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" ----- FUZZY SEARCH PLUG
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
" Plug 'jremmen/vim-ripgrep'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
" ----- GIT PLUG
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" Plug 'rbong/vim-flog'
" ----- STATUS/HELPER
Plug 'itchyny/lightline.vim'
Plug 'mbbill/undotree'
Plug 'vimpostor/vim-tpipeline'
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
Plug 'airblade/vim-current-search-match'
" Plug 'Yggdroot/indentLine'
" Plug 'wfxr/minimap.vim'
" ----- VIM CORE HELPER -----
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'ojroques/vim-oscyank'
" ----- COLORSCHEME PLUG
Plug 'morhetz/gruvbox'
Plug 'pbrisbin/vim-colors-off'
" Plug 'tjdevries/colorbuddy.vim'
" Plug 'junegunn/goyo.vim'
call plug#end()


" LSP config (the mappings used in the default file don't quite work right)
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <space>E <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <space>e <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
" autocmd CursorHold   * lua vim.lsp.buf.document_highlight()
" autocmd CursorHoldI  * lua vim.lsp.buf.document_highlight()
" autocmd CursorMoved  * lua vim.lsp.buf.clear_references()
" autocmd CursorMovedI * lua vim.lsp.buf.clear_references()
lua << EOF
-- write lua here
EOF


" ----- START OF - FOR SOME REASON THIS CONFIG SHOULD BE HERE

" let closetag on react file -----
let g:closetag_filenames = '*.js, *.jsx, *.tsx'
" `<Link>` will be closed while `<link>` won't -----
let g:closetag_emptyTags_caseSensitive = 1

" disable warning on small screen
let g:fern_renderer_devicons_disable_warning = 1
let g:fern#renderer = "devicons"

" ------ END OF - FOR SOME REASON THIS CONFIG SHOULD BE HERE


" ----- LEADER KEY -----
let mapleader = " "
let maplocalleader = "\\"


" ----- MAPPING KEYS -----
" ----- SHORTCUT BASIC
nnoremap <silent> <leader>h :wincmd h<CR>
nnoremap <silent> <leader>j :wincmd j<CR>
nnoremap <silent> <leader>k :wincmd k<CR>
nnoremap <silent> <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeToggle<CR>:UndotreeFocus<CR>
nnoremap <silent> <Plug>(my-fern-toggle) :Fern . -drawer -reveal=% -width=27 -toggle<CR>
nmap <Leader>pv <Plug>(my-fern-toggle)<Plug>(fern-action-zoom:reset)
" reindexing node tree on current file buffer
nnoremap <silent> <Leader>pr :Fern . -drawer -reveal=% -width=27 -toggle<CR>:Fern . -drawer -reveal=% -width=27 -toggle<CR><C-w><C-p>
nnoremap <silent> <Leader>- :vertical resize -10<CR>
nnoremap <silent> <Leader>= :vertical resize +10<CR>
nnoremap <silent> <Leader>0 :resize -3<CR>
nnoremap <silent> <Leader>9 :resize +3<CR>
nnoremap <silent> <Leader>n :noh<CR>

" ----- TAB SWITCHER
nnoremap <C-k> :tabprevious<CR>
nnoremap <C-j> :tabnext<CR>

" ----- EDITING
iabbrev /* /*  */<esc>bhhi<del>
inoremap <M-;> <esc>v$<esc>`>a;<esc>`<a
inoremap <c-b> <esc><right>dwi
inoremap <silent> jj <c-o>:call search('}\\|)\\|]\\|>\\|"', 'cW')<cr><Right>
nnoremap <M-j> ddp
nnoremap <M-k> ddkP
nnoremap <leader>sr :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>
nnoremap <localleader>a ggVG
vnoremap $ $<left>
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '>-2<CR>gv=gv
vnoremap w e

" ----- CALCULATOR
nnoremap Q 0yt=A<C-r>=<C-r>"<CR><Esc>

" ----- SESSION BUFFER CONTROLLER
nnoremap <localleader>b :bprevious<CR>
nnoremap <localleader>n :bnext<CR>
nnoremap <localleader>o :source ~\vim_session<cr>
nnoremap <localleader>s :mksession! ~\vim_session<cr>

" ----- CD TO CURRENT BUFFER's DIR | lcd -> for cding the current buffer only to the current dir
nnoremap <localleader>cd :cd %:p:h<CR>
nnoremap <localleader>lcd :lcd %:p:h<CR>


" ----- BOILERPLATES -----
nnoremap <leader>,html :-1read $HOME/boilerplates/skeleton.html<CR>3j2wf>a


" ----- LINE HIGHLIGHT -----
" define line highlight color
highlight LineHighlight ctermbg=darkgray guibg=black
" highlight the current line
nnoremap <silent> <localleader>h :call matchadd('LineHighlight', '\%'.line('.').'l')<CR>
" clear all the highlighted lines
nnoremap <silent> <localleader>H :call clearmatches()<CR>


" ----- RE-EXECUTE NECCESSARY FILE WHILE SOURCE % { THEME } -----
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
lua require("lsp/tsserver")
lua require("lsp/vimls")
lua require("lsp-compe")
