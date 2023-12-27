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

-- LUA LSP SETUP
require("neodev").setup({})

local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = {
					"vim",
					"describe",
					"it",
					"before_each",
					"after_each",
					"pending",
				},
			},
			workspace = { library = vim.api.nvim_get_runtime_file("", true) },
			telemetry = { enable = false },
		},
	},
})

-- TSSERVER SETUP
lspconfig.lua_ls.setup({
	on_init = function(client)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentFormattingRangeProvider = false
	end,
	init_options = {
		hostInfo = "neovim",
		preferences = {
			autoImportFileExcludePatterns = {
				"**/@mui/**",
			},
			importModuleSpecifierPreference = "auto",
		},
	},
})
