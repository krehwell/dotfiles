" ----- FUZZY SEARCH -----


" ----- TELESCOPE -----
nnoremap <C-f> :Telescope live_grep<CR>
nnoremap <C-g> :Telescope grep_string search=
nnoremap <C-p> :lua require'fallback-findfiles'.project_files()<CR>
command! -nargs=0 Ls :Telescope buffers


" ----- CRTL-P CONFIG
" USED - let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" USED - let g:ctrlp_custom_ignore = {
" USED -             \ 'dir':  '\.git$\|\.yardoc\|public$|log\|tmp$',
" USED -             \ 'file': '\.so$\|\.dat$|\.DS_Store$'
" USED -             \ }
" USED - let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
" USED - let g:ctrlp_use_caching=0
" USED - if executable('rg')
" USED -     let g:rg_derive_root='true'
" USED - endif
" USED - if executable('ag')
" USED -     let g:rg_derive_root='true'
" USED - endif
" USED - let g:ctrlp_working_path_mode = 'ra'
" USED -
" USED - " DELETE BUFFER ON CTRL-P BUFFER
" USED - let g:ctrlp_buffer_func = { 'enter': 'CtrlPBDelete' }
" USED -
" USED - function! CtrlPBDelete()
" USED -     nnoremap <buffer> <silent> <F10> :call <sid>DeleteMarkedBuffers()<cr>
" USED - endfunction
" USED -
" USED - function! s:DeleteMarkedBuffers()
" USED -     " list all marked buffers
" USED -     let marked = ctrlp#getmarkedlist()
" USED -
" USED -     " the file under the cursor is implicitly marked
" USED -     if empty(marked)
" USED -         call add(marked, fnamemodify(ctrlp#getcline(), ':p'))
" USED -     endif
" USED -
" USED -     " call bdelete on all marked buffers
" USED -     for fname in marked
" USED -         let bufid = fname =~ '\[\d\+\*No Name\]$' ? str2nr(matchstr(fname, '\d\+'))
" USED -                     \ : fnamemodify(fname[2:], ':p')
" USED -         exec "silent! bdelete" bufid
" USED -     endfor
" USED -
" USED -     " refresh ctrlp
" USED -     exec "normal \<F5>"
" USED - endfunction
" USED -
" USED - " MAPPING CtrlPBuffer
" USED - command! -nargs=0 Ls :CtrlPBuffer


" ----- FZF CONFIG
" Default options are --nogroup --column --color
" nnoremap <silent><C-p> :FZF<CR>
" nnoremap <C-g> :GFiles<Cr>
" USED - nnoremap <C-f> :Ag<Cr>

" USED - let s:ag_options = ' --one-device --skip-vcs-ignores --smart-case --ignore node_modules'
" USED - let g:agprg='ag -S --nocolor --nogroup --column --ignore node_modules --ignore "./public/stylesheets/*"'

" USED - command! -bang -nargs=* Ag
" USED            \ call fzf#vim#ag(
" USED            \   <q-args>,
" USED            \   s:ag_options,
" USED            \  <bang>0 ? fzf#vim#with_preview('up:60%')
" USED            \        : fzf#vim#with_preview('right:50%', '?'),
" USED            \   <bang>0
" USED            \ )
