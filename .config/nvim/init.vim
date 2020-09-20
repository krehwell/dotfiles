" Windows Area ==========
" ----- WIN 10 SCREEN - BUF(at start) FIX -----
set t_ut=""
set t_md=
set t_u7=


"  syntax on
" ----- ONE STATUS -----
set laststatus=0
" set noruler
augroup entervim 
" au BufWrite * :OneStatus
" autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand("%"))
" autocmd BufEnter * call system("tmux rename-window " . expand("%:t"))
" autocmd VimLeave * call system("tmux rename-window bash")
" autocmd BufEnter * let &titlestring = ' ' . expand("%:t")                                                                 
set noshowcmd

" ----- AU BUFFER MEH ------
" autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
" autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" ----- ALL SET -----
" set ve+=onemore                                                     " enable to go to one more line
" autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o  " disabling comment on newline 
set title
set formatoptions-=cro " formatoptions-=r formatoptions-=o            " disabling comment on newline 
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab                    " own indenting
set backspace=indent,eol,start
set smartindent
set nonu                                                              " number shows
set nowrap
set ignorecase
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

" ----- VIM PLUG ----- 
call plug#begin('~/vim/plugged')
" ------
Plug 'morhetz/gruvbox'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'itchyny/lightline.vim'
Plug 'mbbill/undotree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rstacruz/vim-closer'
Plug 'narajaon/onestatus'
Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript'
Plug 'chemzqm/vim-jsx-improve'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

" ----- LEADER KEY -----
let mapleader = " "

" ----- NETRW SETTINGS -----
" let g:netrw_browse_split=2
" let g:netrw_banner = 0
" let NERDTreeMinimalUI=1
" let g:netrw_winsize=20

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
let s:ag_options = ' --one-device --skip-vcs-ignores --smart-case '
command! -bang -nargs=* Ag
      \ call fzf#vim#ag(
      \   <q-args>,
      \   s:ag_options,
      \  <bang>0 ? fzf#vim#with_preview('up:60%')
      \        : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0
      \ )

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
let g:gruvbox_bold= '0'
set background=dark
" set termguicolors
colorscheme gruvbox

" ----- SHORTCUT -----
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
" nnoremap <leader>pv <CMD>:CHADopen<CR>
" nnoremap <leader>pv <c-w>v :Dirvish <bar> :vertical resize 30<CR>
" nnoremap <silent> <Leader>pv :Fern . -drawer -width=27 -toggle<CR><C-w>=
nnoremap <silent> <Leader>pv :Fern . -drawer -reveal=% -width=27 -toggle<CR><C-w>=
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
nnoremap <leader>,html :-1read $HOME/boilerplates/skeleton.html<CR>3j2wf>a
nnoremap <leader>,exp :-1read $HOME/boilerplates/expressServer.js<CR>4j
" nnoremap ,com :-1read $HOME/templates/.comment.js<CR>2wa
iabbrev <// </<C-X><C-O>

" own meme templates
" command! Memestonkface :r ~/templates/stonkface.txt
" command! Memestonk :r ~/templates/stonk.txt
" command! Memestonkbig :r ~/templates/stonk100.txt
" command! Memeiknow :r ~/templates/iknow.txt
" command! Memesadboy :r ~/templates/sadmemewojak.txt

" Buffer copy by meh
" copy
" vnoremap <C-c> :w! ~/.vimbuffer<CR>
" vnoremap <C-c> :.w! ~/.vimbuffer<CR>
" nnoremap Y 0vg_y
" nnoremap <C-m> :r ~/.vimbuffer<CR>
