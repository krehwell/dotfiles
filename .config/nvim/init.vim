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
call plug#end()


" ----- CLOSE TAG -----
let g:closetag_filenames = '*.js, *.jsx'


" ----- GIT -----
let g:gitgutter_map_keys=0                                         " prevent default key binding
set diffopt+=vertical
nmap [c <Plug>(GitGutterPrevHunk)
nmap ]c <Plug>(GitGutterNextHunk)
nnoremap gs :Gstatus<CR>


" ----- FUZZY SEARCH -----
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|public$|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_use_caching=0
if executable('rg')
  let g:rg_derive_root='true'
endif
if executable('ag')
  let g:rg_derive_root='true'
endif
" Default options are --nogroup --column --color | Ag fuzzy settings
" nnoremap <silent><C-p> :FZF<CR>
nnoremap <C-f> :Ag<Cr>
" nnoremap <C-g> :GFiles<Cr>
let s:ag_options = ' --one-device --skip-vcs-ignores --smart-case --ignore node_modules'
let g:agprg='ag -S --nocolor --nogroup --column --ignore node_modules --ignore "./public/stylesheets/*"'
command! -bang -nargs=* Ag
      \ call fzf#vim#ag(
      \   <q-args>,
      \   s:ag_options,
      \  <bang>0 ? fzf#vim#with_preview('up:60%')
      \        : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0
      \ )


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
" Jump to error
nnoremap <leader>e :call CocAction('diagnosticNext')<CR>
nnoremap <leader>E :call CocAction('diagnosticPrevious')<CR>


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
nnoremap <silent> <Leader>pv :Fern . -drawer -reveal=% -width=27 -toggle<CR><C-w>=
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
