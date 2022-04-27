" ----- COC SETUP -----
if has_key(plugs, "coc.nvim") " Check if coc exist - closing scope is at the very bottom

" ----- PLUGIN REST ASSURE
let g:coc_global_extensions = [
            \ 'coc-pairs',
            \ 'coc-tsserver',
            \ 'coc-eslint',
            \ 'coc-prettier',
            \ 'coc-json',
            \ 'coc-html',
            \ 'coc-css',
            \ 'coc-highlight',
            \ 'coc-spell-checker',
            \ 'coc-sumneko-lua',
            \ ]


" ----- FILE MAP -----
let g:coc_filetype_map = {
      \ 'xhtml': 'html',
      \ }


" ----- TAB TO SCROLL THRU COMPLETION
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" ----- CODE PRETTIER
" cSpell:disable
command! -nargs=0 Prettier :CocCommand prettier.formatFile
command! -nargs=0 PRettier :CocCommand prettier.formatFile
command! -nargs=0 PREttier :CocCommand prettier.formatFile
command! -nargs=0 PERttier :CocCommand prettier.formatFile
command! -nargs=0 Perttier :CocCommand prettier.formatFile
command! -nargs=0 Perttiere :CocCommand prettier.formatFile
" cSpell:enable

" ----- FORMATTING SELECTED CODE
xmap <leader>f  <Plug>(coc-format-selected)
vmap <leader>f  <Plug>(coc-format-selected)
nnoremap <leader>f :CocCommand prettier.formatFile<CR>
augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


" ----- <C-space> TO TRIGGER COMPLETION
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif


" ----- HIGHLIGHT SYMBOL-REFERENCES ON HOLDING CURSOR
autocmd CursorHold * silent call CocActionAsync('highlight')


" ----- SHOW DOCUMENTATION ON <SHIFT-k>
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" REMAP <C-j> AND <C-k> FOR SCROLL FLOAT WINDOWS/POPUPS.
nnoremap <nowait><expr> <C-j> coc#float#has_scroll() ? coc#float#scroll(1) : ":tabnext\<CR>"
nnoremap <nowait><expr> <C-k> coc#float#has_scroll() ? coc#float#scroll(0) : ":tabprevious\<CR>"
inoremap <nowait><expr> <C-j> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : ""
inoremap <nowait><expr> <C-k> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : ""


" ----- CHANGE INSIDE/AROUND FUNCTION/CLASS
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)


" ----- RENAMING <F2>
nmap <f2> <Plug>(coc-rename)


" ----- CODE NAVIGATION
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" ----- JUMP TO ERROR
nmap <silent> <leader>e <plug>(coc-diagnostic-next-error)
nmap <silent> <leader>E <plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>w <plug>(coc-diagnostic-next)
nmap <silent> <leader>W <plug>(coc-diagnostic-prev)


" ----- FIX ACTION
nmap qf <Plug>(coc-fix-current)
nmap ca <Plug>(coc-codeaction-selected)


" ----- COLOR
nnoremap <localleader>cp :call CocAction('colorPresentation')<CR>
nnoremap <localleader>cs :call CocAction('pickColor')<CR>

" ----- YANK
nnoremap <silent> <leader>y :<C-u>CocList yank<cr>

endif " closing if scope
