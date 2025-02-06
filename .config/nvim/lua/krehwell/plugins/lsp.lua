return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", opts = { ui = { border = "rounded" } }, cmd = { "Mason" } },
		{ "b0o/SchemaStore.nvim", name = "schema-store" },
		-- { "williamboman/mason-lspconfig.nvim" },
	},
	ft = require("krehwell.lsp-utils").fts,
	config = function()
		local lsp_hover = require("krehwell.lsp-hover")
		local lsp_utils = require("krehwell.lsp-utils")
		local lspconfig = require("lspconfig")
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "LSP actions",
			callback = function(event)
				vim.diagnostic.config(lsp_utils.diagnostic_config)
				lsp_utils.on_attach(event.buf)

				lsp_hover.setup({
					["^lua_ls"] = {
						border_hl = "Special",
					},
					["^ts_ls"] = {
						border_hl = "Special",
					},
				})
				-- vim.lsp.handlers["textDocument/hover"] =
				-- 	vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded", max_height = 20, max_width = 80 })
				--
				-- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
				-- 	vim.lsp.handlers.signature_help,
				-- 	{ border = "rounded", max_height = 20, max_width = 80 }
				-- )
			end,
		})

		require("mason").setup({})

		-- LUA SETUP
		lspconfig.lua_ls.setup({
			on_init = function(client)
				client.server_capabilities.semanticTokensProvider = nil
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false
			end,
		})

		-- TSSERVER SETUP
		lspconfig.biome.setup({
			on_init = function(client)
				client.server_capabilities.semanticTokensProvider = nil
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false
			end,
			capabilities = capabilities,
		})
		lspconfig.ts_ls.setup({
			on_init = function(client)
				client.server_capabilities.semanticTokensProvider = nil
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false
			end,

			capabilities = capabilities,

			root_dir = lspconfig.util.root_pattern("tsconfig.json", "jsconfig.json", "package.json"),

			init_options = {
				preferences = {
					autoImportFileExcludePatterns = {
						-- "**/@mui/**",
						"**/*vidstack/**",
						"**/next/dist/**",
						"**/@sentry/**",
						"**/e2e/**",
					},
					importModuleSpecifierPreference = "auto",
					lazyConfiguredProjectsFromExternalProject = false,
					interactiveInlayHints = false,
				},
				typescript = {
					-- updateImportsOnFileMove = { enabled = "always" },
					-- suggest = {
					-- 	completeFunctionCalls = true,
					-- },
					-- inlayHints = {
					-- 	enumMemberValues = { enabled = true },
					-- 	functionLikeReturnTypes = { enabled = true },
					-- 	parameterNames = { enabled = "literals" },
					-- 	parameterTypes = { enabled = true },
					-- 	propertyDeclarationTypes = { enabled = true },
					-- 	variableTypes = { enabled = false },
					-- },
				},
			},
			single_file_support = true,
		})

		-- lspconfig.denols.setup({
		-- 	root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc", "deno.lock"),
		-- })

		-- lspconfig.vtsls.setup({
		-- 	capabilities = capabilities,
		-- 	on_init = function(client)
		-- 		client.server_capabilities.semanticTokensProvider = nil
		-- 		client.server_capabilities.documentFormattingProvider = false
		-- 		client.server_capabilities.documentRangeFormattingProvider = false
		-- 	end,
		-- 	root_dir = lspconfig.util.root_pattern("package.json"),
		-- 	single_file_support = false,
		-- 	settings = {
		-- 		vtsls = {
		-- 			enableMoveToFileCodeAction = true,
		-- 			autoUseWorkspaceTsdk = true,
		-- 			experimental = {
		-- 				completion = {
		-- 					enableServerSideFuzzyMatch = true,
		-- 				},
		-- 			},
		-- 		},
		-- 		typescript = {
		-- 			-- updateImportsOnFileMove = { enabled = "always" },
		-- 			suggest = {
		-- 				completeFunctionCalls = true,
		-- 			},
		-- 			inlayHints = {
		-- 				-- enumMemberValues = { enabled = true },
		-- 				-- functionLikeReturnTypes = { enabled = true },
		-- 				-- parameterNames = { enabled = "literals" },
		-- 				-- parameterTypes = { enabled = true },
		-- 				-- propertyDeclarationTypes = { enabled = true },
		-- 				-- variableTypes = { enabled = false },
		-- 			},
		-- 		},
		-- 	},
		-- })

		lspconfig.jsonls.setup({
			capabilities = capabilities,
			settings = { json = { schemas = require("schemastore").json.schemas() } },
		})

		-- lspconfig.custom_elements_ls.setup({ capabilities = capabilities })

		lspconfig.tailwindcss.setup({})

		lspconfig.cssls.setup({ capabilities = capabilities })
		lspconfig.cssmodules_ls.setup({ capabilities = capabilities })
		lspconfig.html.setup({ capabilities = capabilities })
		lspconfig.css_variables.setup({ capabilities = capabilities })

		lspconfig.gopls.setup({})
	end,
}
