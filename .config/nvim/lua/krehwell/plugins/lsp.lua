return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", opts = { ui = { border = "rounded" } }, cmd = { "Mason" } },
		{ "b0o/SchemaStore.nvim", name = "schema-store" },
		-- { "williamboman/mason-lspconfig.nvim" },
	},
	ft = require("krehwell.lsp-utils").fts,
	opts = {
		servers = {
			lua_ls = {
				on_init = function(client)
					client.server_capabilities.semanticTokensProvider = nil
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
				end,
			},

			vtsls = {
				root_dir = require("lspconfig.util").root_pattern("package.json"),
				single_file_support = false,
				settings = {
					typescript = {
						tsserver = {
							-- maxTsServerMemory = 4000,
						},
						updateImportsOnFileMove = {
							enabled = "always",
						},
						inlayHints = false,
						preferences = {
							importModuleSpecifier = "auto",
							includePackageJsonAutoImports = "off",
							disableSuggestions = true,
							autoImportFileExcludePatterns = {
								"**/@mui/**",
								"**/*vidstack/**",
								"**/next/dist/**",
								"**/@dnd-kit/**",
								"@knowt/editor",
								"**/@sentry/**",
								"**/e2e/**",
							},
						},
					},
					vtsls = {
						autoUseWorkspaceTsdk = true,
						experimental = {
							completion = {
								enableServerSideFuzzyMatch = true,
							},
						},
					},
				},
				refactor_auto_rename = true,
			},

			-- ts_ls = {
			-- 	on_init = function(client)
			-- 		client.server_capabilities.semanticTokensProvider = nil
			-- 		client.server_capabilities.documentFormattingProvider = false
			-- 		client.server_capabilities.documentRangeFormattingProvider = false
			-- 	end,

			-- 	root_dir = require("lspconfig").util.root_pattern("tsconfig.json", "jsconfig.json", "package.json"),

			-- 	init_options = {
			-- 		preferences = {
			-- 			autoImportFileExcludePatterns = {
			-- 				"**/@mui/**",
			-- 				"**/*vidstack/**",
			-- 				"**/next/dist/**",
			-- 				"**/@dnd-kit/**",
			-- 				"@knowt/editor",
			-- 				"**/@sentry/**",
			-- 				"**/e2e/**",
			-- 			},
			-- 			importModuleSpecifierPreference = "auto",
			-- 			lazyConfiguredProjectsFromExternalProject = false,
			-- 			disableSuggestions = true,
			-- 			interactiveInlayHints = false,
			-- 		},
			-- 	},
			-- 	settings = {
			-- 		-- maxTsServerMemory = 8192,
			-- 		typescript = {
			-- 			tsserver = {
			-- 				useSyntaxServer = true,
			-- 			},
			-- 		},
			-- 	},
			-- 	single_file_support = true,
			-- },

			-- denols = {
			-- 	root_dir = require("lspconfig").util.root_pattern("deno.json", "deno.jsonc", "deno.lock"),
			-- },

			-- jsonls = {
			-- 	settings = { json = { schemas = require("schemastore").json.schemas() } },
			-- },
			-- tailwindcss = {},
			typos_lsp = {},
			biome = {},
			cssls = {},
			cssmodules_ls = {},
			html = {},
			css_variables = {},
			gopls = {},
		},
	},
	config = function(_, opts)
		local lsp_utils = require("krehwell.lsp-utils")
		local lspconfig = require("lspconfig")
		require("mason").setup({})

		for server, config in pairs(opts.servers) do
			-- passing config.capabilities to blink.cmp merges with the capabilities in your
			-- `opts[server].capabilities, if you've defined it
			config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
			lspconfig[server].setup(config)
		end

		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "LSP User Setup",
			callback = function(event)
				vim.diagnostic.config(lsp_utils.diagnostic_config)
				lsp_utils.on_attach(event.buf)
			end,
		})
	end,
}
