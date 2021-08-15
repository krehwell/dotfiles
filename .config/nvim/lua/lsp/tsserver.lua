-- require'lspconfig'.tsserver.setup({
--     on_attach = require('lsp-highlight-on_attach').on_attach
-- })
require'lspconfig'.tsserver.setup(coq.lsp_ensure_capabilities({
    on_attach = require('lsp-highlight-on_attach').on_attach
}))
