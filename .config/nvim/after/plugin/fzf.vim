" ----- FUZZY SEARCH -----

if has_key(plugs, "fzf.vim")
" ----- CRTL-P CONFIG
    if has_key(plugs, "ctrlp.vim")
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

        " MAPPING CtrlPBuffer
        command! -nargs=0 Ls :CtrlPBuffer

    elseif has_key(plugs, "telescope.nvim")
        nnoremap <C-p> :lua require'telescope-fallback-findfiles'.project_files()<CR>
        command! -nargs=0 Ls :Telescope buffers
    endif

" DELETE BUFFER ON CTRL-P BUFFER
let g:ctrlp_buffer_func = { 'enter': 'CtrlPBDelete' }

function! CtrlPBDelete()
    nnoremap <buffer> <silent> <F10> :call <sid>DeleteMarkedBuffers()<cr>
endfunction

function! s:DeleteMarkedBuffers()
    " list all marked buffers
    let marked = ctrlp#getmarkedlist()

    " the file under the cursor is implicitly marked
    if empty(marked)
        call add(marked, fnamemodify(ctrlp#getcline(), ':p'))
    endif

    " call bdelete on all marked buffers
    for fname in marked
        let bufid = fname =~ '\[\d\+\*No Name\]$' ? str2nr(matchstr(fname, '\d\+'))
                    \ : fnamemodify(fname[2:], ':p')
        exec "silent! bdelete" bufid
    endfor

    " refresh ctrlp
    exec "normal \<F5>"
endfunction


" ----- FZF CONFIG
" Default options are --nogroup --column --color
" nnoremap <silent><C-p> :FZF<CR>
" nnoremap <C-g> :GFiles<Cr>
nnoremap <C-f> :Ag<Cr>

let s:ag_options = ' --one-device --skip-vcs-ignores --smart-case --ignore node_modules'
let g:agprg='ag -S --nocolor --nogroup --column --ignore node_modules --ignore "./public/stylesheets/*"'

command! -bang -nargs=* Ag
            \ call fzf#vim#ag(
            \   <q-args>,
            \   s:ag_options,
            \  <bang>0 ? fzf#vim#with_preview('up:60%')
            \        : fzf#vim#with_preview('right:50%', '?'),
            \   <bang>0
            \ )

elseif has_key(plugs, "telescope.nvim")
" ----- TELESCOPE
" nnoremap <C-g> :Telescope live_grep<CR>
nnoremap <C-f> :Telescope grep_string search=<CR>
nnoremap <C-g> :Telescope grep_string search=
nnoremap <C-p> :lua require'telescope-fallback-findfiles'.project_files()<CR>
command! -nargs=0 Ls :Telescope buffers

endif " closing if scope

