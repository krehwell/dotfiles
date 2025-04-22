local jsts_settings = {
	suggest = { completeFunctionCalls = true },
	inlayHints = {
		functionLikeReturnTypes = { enabled = true },
		parameterNames = { enabled = "literals" },
		variableTypes = { enabled = true },
	},
}

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", opts = { ui = { border = "rounded" } }, cmd = { "Mason" } },
		{ "b0o/SchemaStore.nvim", name = "schema-store" },
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
				root_markers = { "tsconfig.json", "jsonconfig.json" },
				settings = {
					typescript = jsts_settings,
					javascript = jsts_settings,
					vtsls = {
						autoUseWorkspaceTsdk = true,
						experimental = {
							maxInlayHintLength = 30,
							completion = {
								enableServerSideFuzzyMatch = true,
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
		local lsp_utils = require("krehwell.lsp-utils")
		local lspconfig = require("lspconfig")
		require("mason").setup({})

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
