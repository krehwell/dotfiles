" ----- FUZZY SEARCH -----


" ----- CRTL-P CONFIG -----
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
let g:ctrlp_working_path_mode = 'ra'


" ----- FZF CONFIG -----
" Default options are --nogroup --column --color
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

