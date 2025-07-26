local jsts_settings = {
	suggest = { completeFunctionCalls = false },
	inlayHints = {
		functionLikeReturnTypes = { enabled = true },
		parameterNames = { enabled = "literals" },
		variableTypes = { enabled = true },
	},
	preferences = {
		excludeModuleSpecifierAutoImports = {
			"@vidstack/*",
			"@mui/*",
			"@next/dist",
		},
	},
	updateImportsOnFileMove = {
		enabled = "always",
	},
}

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", cmd = { "Mason" } },
		-- { "b0o/SchemaStore.nvim", name = "schema-store" },
		-- {
		-- 	"zeioth/garbage-day.nvim",
		-- 	dependencies = "neovim/nvim-lspconfig",
		-- 	event = "InsertEnter",
		-- 	opts = { notifications = true },
		-- },
		{ "chrisgrieser/nvim-early-retirement", event = "InsertEnter", opts = { retirementAgeMins = 15 } },
		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
				library = {
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
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
				filetypes = { "lua" },
				root_markers = { ".luarc.json", ".luarc.jsonc" },
				settings = {
					Lua = {
						completion = { callSnippet = "Replace" },
						format = { enable = false },
						hint = {
							enable = true,
							arrayIndex = "Disable",
						},
						runtime = {
							version = "LuaJIT",
						},
						workspace = {
							checkThirdParty = false,
							library = {
								vim.env.VIMRUNTIME,
								"${3rd}/luv/library",
							},
						},
					},
				},
			},

			vtsls = {
				filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
				on_init = function(client)
					client.server_capabilities.semanticTokensProvider = nil
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
				end,
				root_markers = { "tsconfig.json", "jsonconfig.json", "package.json" },
				settings = {
					typescript = jsts_settings,
					javascript = jsts_settings,
					vtsls = {
						experimental = {
							completion = {
								enableServerSideFuzzyMatch = true,
							},
						},
						typescript = {
							preferences = {
								includePackageJsonAutoImports = "auto",
							},
						},
					},
				},
			},

			-- denols = {
			-- 	root_dir = require("lspconfig").util.root_pattern("deno.json", "deno.jsonc", "deno.lock"),
			-- },

			jsonls = {
				filetypes = { "json", "jsonc" },
				settings = {
					json = {
						validate = { enable = true },
						-- schemas = require("schema-store").json.schemas(),
					},
				},
			},
			-- tailwindcss = {},
			typos_lsp = {},
			typos = {},
			biome = {},
			cssls = {},
			cssmodules_ls = {},
			html = {
				filetypes = { "html" },
				embeddedLanguages = { css = true, javascript = true },
			},
			css_variables = {},
			gopls = {},
		},
	},
	config = function(_, opts)
		require("mason").setup({})
		local lsp_utils = require("krehwell.lsp-utils")
		local lspconfig = require("lspconfig")

		for server, config in pairs(opts.servers) do
			config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
			lspconfig[server].setup(config)
		end

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("krehwell/lsp_configure", { clear = true }),
			desc = "LSP User Setup",

			callback = function(event)
				vim.diagnostic.config(lsp_utils.diagnostic_config)
				lsp_utils.on_attach(event.buf)
			end,
		})
	end,
}
