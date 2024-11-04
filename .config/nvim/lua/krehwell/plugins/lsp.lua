return {
	-- "VonHeikemen/lsp-zero.nvim",
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", opts = { ui = { border = "rounded" } }, cmd = { "Mason" } },
		{
			"dmmulroy/ts-error-translator.nvim",
			event = "LspAttach",
			ft = { "typescript", "typescriptreact" },
		},
		-- { "williamboman/mason-lspconfig.nvim" },
	},
	ft = require("krehwell.lsp-utils").fts,
	config = function()
		local lsp_utils = require("krehwell.lsp-utils")
		local lspconfig = require("lspconfig")

		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "LSP actions",
			callback = function(event)
				vim.diagnostic.config(lsp_utils.diagnostic_config)
				lsp_utils.on_attach(event.buf)
			end,
		})

		require("mason").setup({})
		-- require("mason-lspconfig").setup({
		-- 	ensure_installed = { "tsserver", "gopls", "cssls", "html", "jsonls", "vimls", "cssmodules_ls" },
		-- })

		-- LUA SETUP
		lspconfig.lua_ls.setup({
			cmd = { "lua-language-server" },
			on_init = function(client)
				client.server_capabilities.semanticTokensProvider = nil
			end,
			settings = {
				Lua = {
					runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
					diagnostics = { globals = { "vim", "require", "nvim" } },
					telemetry = { enable = false },
					workspace = {
						-- checkThirdParty = false,
						-- library = vim.api.nvim_get_runtime_file("", true),
					},
				},
			},
		})

		-- TSSERVER SETUP
		lspconfig.vtsls.setup({
			on_init = function(client)
				client.server_capabilities.semanticTokensProvider = nil
			end,
			filetypes = {
				"javascript",
				"javascriptreact",
				"javascript.jsx",
				"typescript",
				"typescriptreact",
				"typescript.tsx",
			},
			settings = {
				complete_function_calls = true,
				vtsls = {
					enableMoveToFileCodeAction = true,
					autoUseWorkspaceTsdk = true,
					experimental = {
						completion = {
							enableServerSideFuzzyMatch = true,
						},
					},
				},
				typescript = {
					updateImportsOnFileMove = { enabled = "always" },
					suggest = {
						completeFunctionCalls = true,
					},
					inlayHints = {
						enumMemberValues = { enabled = true },
						functionLikeReturnTypes = { enabled = true },
						parameterNames = { enabled = "literals" },
						parameterTypes = { enabled = true },
						propertyDeclarationTypes = { enabled = true },
						variableTypes = { enabled = false },
					},
				},
			},
		})

		lspconfig.tailwindcss.setup({})

		lspconfig.cssls.setup({})

		lspconfig.cssmodules_ls.setup({})

		lspconfig.cssls.setup({})

		lspconfig.gopls.setup({})
	end,
}
