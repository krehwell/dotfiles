require'lspconfig'.tsserver.setup({
    on_attach = require('lsp-highlight-on_attach').on_attach
})
