local luadev = require("lua-dev").setup(({
    -- on_attach = require('lsp-highlight-on_attach').on_attach
}))

local lspconfig = require('lspconfig')
lspconfig.sumneko_lua.setup(luadev)
