local jsts_settings = {
	preferences = {
		includePackageJsonAutoImports = "off",
		useAliasesForRenames = false,
		renameShorthandProperties = false,
		autoImportFileExcludePatterns = {
			"@vidstack",
			"@vidstack/*",
			"vidstack/*",
			"@mui",
			"@mui/*",
			"@mui/**",
			"@next/dist",
			"@next/dist/*",
		},
		tsserver = {
			watchOptions = {
				excludeDirectories = { "node_modules", "dist", ".next", "out" },
			},
		},
	},
	updateImportsOnFileMove = {
		enabled = "always",
	},
}

return {
	"b0o/SchemaStore.nvim",
	cmd = { "Mason" },
	dependencies = {
		{ "williamboman/mason.nvim" },
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
				cmd = { "lua-language-server" },
				on_init = function(client)
					client.server_capabilities.semanticTokensProvider = nil
					client.server_capabilities.documentHighlightProvider = false
				end,
				filetypes = { "lua" },
				root_dir = vim.fs.root(0, { ".luarc.json", ".luarc.jsonc" }),
				settings = {
					Lua = {
						completion = { callSnippet = "Replace" },
						format = { enable = false },
						hint = {
							enable = true,
							arrayIndex = "Disable",
						},
						runtime = { version = "LuaJIT" },
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
				cmd = { "vtsls", "--stdio" },
				on_init = function(client)
					client.server_capabilities.semanticTokensProvider = nil
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
					client.server_capabilities.codeLensProvider = nil
					client.server_capabilities.documentHighlightProvider = false

					local biome_config = {
						cmd = { "biome", "lsp-proxy" },
						root_dir = vim.fs.root(0, { "tsconfig.json", "jsconfig.json", "package.json" }),
					}

					vim.lsp.config("biome", biome_config)
					vim.lsp.enable("biome")
				end,
				root_dir = vim.fs.root(0, { "tsconfig.json", "jsconfig.json", "package.json" }),
				settings = {
					typescript = jsts_settings,
					javascript = jsts_settings,
				},
			},

			-- deno = {
			-- 	cmd = { "deno", "lsp" },
			-- 	root_dir = vim.fs.root(0, { "deno.json", "deno.jsonc" }), -- detect Deno project
			-- 	init_options = {
			-- 		lint = true, -- enable linting
			-- 		unstable = true, -- allow unstable APIs
			-- 		suggest = {
			-- 			imports = {
			-- 				hosts = {
			-- 					["https://deno.land"] = true,
			-- 					["https://cdn.nest.land"] = true,
			-- 					["https://crux.land"] = true,
			-- 				},
			-- 			},
			-- 		},
			-- 	},
			-- 	settings = {},
			-- },

			jsonls = {
				cmd = { "vscode-json-language-server", "--stdio" },
				filetypes = { "json", "jsonc" },
				root_dir = vim.fs.root(0, { "package.json", ".git" }),
				settings = {
					json = {
						validate = { enable = true },
					},
				},
				on_init = function(client)
					-- inject schemas dynamically from SchemaStore
					client.config.settings.json.schemas = require("schemastore").json.schemas()
					client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
				end,
			},

			cssls = {
				cmd = { "vscode-css-language-server", "--stdio" },
				filetypes = { "css" },
			},

			cssmodules_ls = {
				cmd = { "cssmodules-language-server" },
				filetypes = { "css" },
			},

			css_variables = {
				cmd = { "css-variables-language-server", "--stdio" },
				filetypes = { "css" },
			},

			html = {
				cmd = { "vscode-html-language-server", "--stdio" },
				filetypes = { "html" },
				embeddedLanguages = { css = true, javascript = true },
			},

			gopls = {
				cmd = { "gopls" },
			},

			typos_lsp = {
				cmd = { "typos-lsp" },
			},

			typos = {
				cmd = { "typos-lsp" },
			},
		},
	},
	config = function(_, opts)
		require("mason").setup({})
		local lsp_utils = require("krehwell.lsp-utils")

		for server, config in pairs(opts.servers) do
			vim.lsp.config(server, config)
			vim.lsp.enable(server)
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
