return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v3.x",
	dependencies = {
		{ "neovim/nvim-lspconfig" },
		{ "williamboman/mason.nvim", opts = { ui = { border = "rounded" } }, cmd = { "Mason" } },
		-- { "williamboman/mason-lspconfig.nvim" },
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
			client.server_capabilities.semanticTokensProvider = nil
			vim.diagnostic.config(lsp_utils.diagnostic_config)
			lsp_utils.on_attach(client, bufnr)
		end)

		lsp_zero.set_sign_icons({ error = "", warn = "", hint = "", info = "" })

        -- LUA SETUP
		lspconfig.lua_ls.setup({
			cmd = { "lua-language-server" },
			on_init = function(client)
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentFormattingRangeProvider = false
			end,
			settings = {
				Lua = {
					runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
					diagnostics = { globals = { "vim", "require" } },
					telemetry = { enable = false },
				},
			},
		})

		-- TSSERVER SETUP
		lspconfig.tsserver.setup({
			root_dir = function(...)
				return require("lspconfig.util").root_pattern(".git")(...)
			end,

			on_init = function(client)
				-- require("ts-error-translator").setup()
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentFormattingRangeProvider = false
			end,

			cmd = { "bunx", "typescript-language-server", "--stdio" },

			init_options = {
				preferences = {
					-- autoImportFileExcludePatterns = { "**/@mui/**" },
					importModuleSpecifierPreference = "auto",
				},
			},
		})

		lspconfig.gopls.setup({})
	end,
}
