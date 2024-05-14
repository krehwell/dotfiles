return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v3.x",
	dependencies = {
		{ "neovim/nvim-lspconfig" },
		{ "williamboman/mason.nvim", opts = { ui = { border = "rounded" } } },
		-- { "williamboman/mason-lspconfig.nvim" },
		{ "folke/neodev.nvim" },
	},
	ft = require("krehwell.lsp-utils").fts,
	config = function()
		local lsp_zero = require("lsp-zero")
		local lsp_utils = require("krehwell.lsp-utils")
		local lspconfig = require("lspconfig")

		require("mason").setup({})
		-- require("mason-lspconfig").setup({
		-- 	ensure_installed = { "tsserver", "gopls", "cssls", "html", "jsonls", "vimls", "cssmodules_ls" },
		-- 	handlers = { lsp_zero.default_setup },
		-- })

		lsp_zero.on_attach(function(client, bufnr)
			lsp_utils.on_attach(client, bufnr)
			vim.diagnostic.config(lsp_utils.diagnostic_config)
			client.server_capabilities.semanticTokensProvider = nil
		end)

		lsp_zero.set_sign_icons({ error = "", warn = "", hint = "", info = "" })

		require("neodev").setup({})

		lspconfig.lua_ls.setup({
			on_init = function(client)
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentFormattingRangeProvider = false
			end,
			cmd = { "lua-language-server" },
			settings = {
				Lua = {
					runtime = {
						version = "LuaJIT",
						path = vim.split(package.path, ";"),
					},
					diagnostics = {
						globals = { "vim" },
					},
					telemetry = { enable = false },
				},
			},
		})

		-- TSSERVER SETUP
		lspconfig.tsserver.setup({
			on_init = function(client)
				require("ts-error-translator").setup()
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentFormattingRangeProvider = false
			end,

			cmd = { "bunx", "typescript-language-server", "--stdio" },

			init_options = {
				hostInfo = "neovim",
				preferences = {
					autoImportFileExcludePatterns = { "**/@mui/**" },
					importModuleSpecifierPreference = "auto",
				},
			},
		})
	end,
}
