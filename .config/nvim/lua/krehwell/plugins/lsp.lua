local jsts_settings = {
	suggest = { completeFunctionCalls = false },
	inlayHints = {
		functionLikeReturnTypes = { enabled = true },
		parameterNames = { enabled = "literals" },
		variableTypes = { enabled = true },
	},
	preferences = {
		excludeModuleSpecifierAutoImports = {
			"@vidstack",
			"@vidstack/*",
			"@mui",
			"@mui/*",
			"@mui/**",
			"@next/dist",
			"@next/dist/*",
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
		{ "b0o/SchemaStore.nvim" },
		-- {
		-- 	"zeioth/garbage-day.nvim",
		-- 	dependencies = "neovim/nvim-lspconfig",
		-- 	event = "InsertEnter",
		-- 	opts = { notifications = true },
		-- },
		-- { "chrisgrieser/nvim-early-retirement", event = "InsertEnter", opts = { retirementAgeMins = 15 } },
		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
				library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } } },
			},
		},
	},
	ft = require("krehwell.lsp-utils").fts,
	opts = {
		servers = {
			lua_ls = {
				on_init = function(client)
					client.server_capabilities.semanticTokensProvider = nil
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
					client.server_capabilities.codeLensProvider = nil
					client.server_capabilities.documentHighlightProvider = false
				end,
				root_markers = { "tsconfig.json", "jsonconfig.json", "package.json" },
				settings = {
					typescript = jsts_settings,
					javascript = jsts_settings,
					vtsls = {
						tsserver = {
							useSyntaxServer = "auto", -- or "semantic" if you want fewer processes
							tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib", -- project ts
							maxTsServerMemory = 4096, -- bump memory if you have big projects
						},
						experimental = {
							completion = {
								enableServerSideFuzzyMatch = true,
							},
						},
						typescript = {
							preferences = {
								includePackageJsonAutoImports = "auto",
							},
							tsserver = {
								-- ignore big folders
								watchOptions = {
									excludeDirectories = { "node_modules", "dist", ".next", "out" },
								},
							},
						},
					},
				},
			},

			-- denols = {
			-- 	root_dir = require("lspconfig").util.root_pattern("deno.json", "deno.jsonc", "deno.lock"),
			-- },

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

		local jsonls_config = {
			filetypes = { "json", "jsonc" },
			settings = {
				json = {
					validate = { enable = true },
					schemas = require("schemastore").json.schemas(),
				},
			},
		}

		-- merge jsonls into opts.servers
		opts.servers = vim.tbl_deep_extend("force", opts.servers, { jsonls = jsonls_config })

		-- configure all servers
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
