return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v4.x",
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
		-- })

		lsp_zero.extend_lspconfig({
			sign_text = false,
			lsp_attach = function(client, bufnr)
				lsp_utils.on_attach(client, bufnr)
				client.server_capabilities.semanticTokensProvider = nil
			end,
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		})

		-- LUA SETUP
		lspconfig.lua_ls.setup({
			cmd = { "lua-language-server" },
			settings = {
				Lua = {
					runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
					diagnostics = { globals = { "vim", "require" } },
					telemetry = { enable = false },
				},
			},
		})

		-- TSSERVER SETUP
		lspconfig.ts_ls.setup({
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
					autoImportFileExcludePatterns = { "**/@mui/**" },
					importModuleSpecifierPreference = "auto",
					lazyConfiguredProjectsFromExternalProject = false,
					interactiveInlayHints = false,
				},
			},
		})

		lspconfig.gopls.setup({})
	end,
}
