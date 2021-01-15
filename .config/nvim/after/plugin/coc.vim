" ----- COC SETUP -----


" ----- TAB TO SCROLL THRU COMPLETION -----
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" ----- CODE PRETTIER -----
command! -nargs=0 Prettier :CocCommand prettier.formatFile

vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" ----- FORMATTING SELECTED CODE -----
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


" ----- <C-space> TO TRIGGER COMPLETION -----
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif


" ----- HIGHLIGHT SYMBOL-REFERENCES ON HOLDING CURSOR -----
autocmd CursorHold * silent call CocActionAsync('highlight')


" ----- SHOW DOCUMENTATION ON <SHIFT-k> -----
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" REMAP <C-j> AND <C-k> FOR SCROLL FLOAT WINDOWS/POPUPS.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-j> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-j>"
  nnoremap <silent><nowait><expr> <C-k> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-k>"
  inoremap <silent><nowait><expr> <C-j> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-k> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-j> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-j>"
  vnoremap <silent><nowait><expr> <C-k> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-k>"
endif


" ----- RENAMING <F2> -----
nmap <f2> <Plug>(coc-rename)


" ----- CODE NAVIGATION -----
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" ----- JUMP TO ERROR -----
nnoremap <leader>e :call CocAction('diagnosticNext')<CR>
nnoremap <leader>E :call CocAction('diagnosticPrevious')<CR>
