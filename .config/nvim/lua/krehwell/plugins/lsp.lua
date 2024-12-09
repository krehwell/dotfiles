return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", opts = { ui = { border = "rounded" } }, cmd = { "Mason" } },
		{ "dmmulroy/ts-error-translator.nvim", event = "LspAttach", ft = { "typescript", "typescriptreact" } },
		{ "b0o/SchemaStore.nvim", name = "schema-store" },
		-- { "williamboman/mason-lspconfig.nvim" },
	},
	ft = require("krehwell.lsp-utils").fts,
	config = function()
		local lsp_utils = require("krehwell.lsp-utils")
		local lspconfig = require("lspconfig")
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true

		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "LSP actions",
			callback = function(event)
				vim.diagnostic.config(lsp_utils.diagnostic_config)
				lsp_utils.on_attach(event.buf)

				vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
					border = "rounded",
					max_height = 20,
					max_width = 70,
				})

				vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
					border = "rounded",
					max_height = 20,
					max_width = 70,
				})
			end,
		})

		require("mason").setup({})

		-- LUA SETUP
		lspconfig.lua_ls.setup({
			cmd = { "lua-language-server" },
			on_init = function(client)
				client.server_capabilities.semanticTokensProvider = nil
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false
			end,
			settings = {
				Lua = {
					runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
					diagnostics = { globals = { "vim", "require", "nvim" } },
					telemetry = { enable = false },
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
						checkThirdParty = false,
					},
				},
			},
		})

		-- TSSERVER SETUP
		lspconfig.biome.setup({})
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
					importModuleSpecifierPreference = "auto",
					lazyConfiguredProjectsFromExternalProject = true,
					interactiveInlayHints = false,
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

		lspconfig.custom_elements_ls.setup({})

		lspconfig.tailwindcss.setup({})

		lspconfig.cssls.setup({ capabilities = capabilities })
		lspconfig.cssmodules_ls.setup({})
		lspconfig.html.setup({})
		lspconfig.css_variables.setup({})

		lspconfig.gopls.setup({})
	end,
}
