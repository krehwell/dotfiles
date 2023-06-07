local present, lsp = pcall(require, "lsp-zero")
local lspsetup = require("krehwell.lspsetup")
if not present then
	return
end

lsp.preset({
	name = "minimal",
	set_lsp_keymaps = false,
	suggest_lsp_servers = false,
	manage_nvim_cmp = false,
})
-- lsp.set_sign_icons({ error = "✘", warn = "▲", hint = "⚑", info = "»" })
lsp.set_sign_icons({ error = "»", warn = "»", hint = "⚑", info = "»" })

lsp.set_server_config({
	on_init = function(client)
		client.server_capabilities.semanticTokensProvider = nil
	end,
})

-- LSP
lsp.ensure_installed({ "tsserver", "gopls", "cssls", "html", "cssmodules_ls", "jsonls" })

-- individual lsp config: luv
require("neodev").setup({})
require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
}))

-- individual lsp config: tsserver
lsp.configure("tsserver", {
	on_init = function(client)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentFormattingRangeProvider = false
	end,
	init_options = {
		hostInfo = "neovim",
		preferences = {
			autoImportFileExcludePatterns = {
				-- "node_modules/@*",
				-- "node_modules/**",
			},
			importModuleSpecifierPreference = "non-relative", -- always prefer alias import from project relative
		},
	},
	filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
})

-- LSP KEYBINDING
lsp.on_attach(lspsetup.on_attach)

lsp.setup()

-- DIAGNOSTIC SETUP | must be at bottom most
vim.diagnostic.config(lspsetup.diagnostic_config)
