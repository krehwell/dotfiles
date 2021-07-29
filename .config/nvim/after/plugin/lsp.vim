if has_key(plugs, "nvim-lspconfig") " Check if coc exist - closing scope is at the very bottom

" LSP config (the mappings used in the default file don't quite work right)
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <space>E <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <space>e <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
inoremap <silent><expr> <C-Space> compe#complete()
command! -nargs=0 Prettier :lua vim.lsp.buf.formatting()

lua << EOF
-- write lua here
EOF

" ----- LUA SOURCE -----
lua require("telescope-config")
lua require("lsp-compe")
lua require("lsp-sumneko")
lua require("lsp-diagnostic")

lua require("lsp/tsserver")
lua require("lsp/cssls")
lua require("lsp/html")
lua require("lsp/ccls")
lua require("lsp/vimls")
lua require("lsp/sumneko_lua")

endif
