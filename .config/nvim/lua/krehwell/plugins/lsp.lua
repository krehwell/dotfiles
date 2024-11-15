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
		lspconfig.ts_ls.setup({
			on_init = function(client)
				client.server_capabilities.semanticTokensProvider = nil
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false
			end,

			capabilities = capabilities,

			init_options = {
				preferences = {
					importModuleSpecifierPreference = "auto",
					lazyConfiguredProjectsFromExternalProject = false,
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

		lspconfig.jsonls.setup({
			capabilities = capabilities,
			settings = { json = { schemas = require("schemastore").json.schemas() } },
		})

		lspconfig.custom_elements_ls.setup({})

		lspconfig.tailwindcss.setup({})

		lspconfig.cssls.setup({ capabilities = capabilities })
		lspconfig.cssmodules_ls.setup({})
		lspconfig.css_variables.setup({})

		lspconfig.gopls.setup({})
	end,
}
