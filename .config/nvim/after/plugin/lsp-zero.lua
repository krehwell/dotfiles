local present, lsp_zero = pcall(require, "lsp-zero")
local lspsetup = require("krehwell.lspsetup")
if not present then
	return
end

-- MASON (LSP INSTALLER)
require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = { "tsserver", "gopls", "cssls", "html", "jsonls", "vimls", "cssmodules_ls", "lua_ls" },
	handlers = { lsp_zero.default_setup },
})

lsp_zero.on_attach(function(client, bufnr)
	lspsetup.on_attach(client, bufnr)
	vim.diagnostic.config(lspsetup.diagnostic_config)
end)
-- lsp_zero.set_sign_icons({ error = "✘", warn = "▲", hint = "⚑", info = "»" })
lsp_zero.set_sign_icons({ error = "", warn = "", hint = "", info = "" })

-- LUA LSP SETUP
require("neodev").setup({})

local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim", "require" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = { enable = false },
		},
	},
})

-- TSSERVER SETUP
lspconfig.tsserver.setup({
	on_init = function(client)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentFormattingRangeProvider = false
	end,

	cmd = { "bunx", "typescript-language-server", "--stdio" },

	init_options = {
		hostInfo = "neovim",
		preferences = {
			autoImportFileExcludePatterns = {
				"node_modules/@mui/**",
				"node_modules/@mui/*",
				"@mui/**",
				-- "node_modules/**",
			},
			importModuleSpecifierPreference = "auto",
		},
	},
	filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
})
