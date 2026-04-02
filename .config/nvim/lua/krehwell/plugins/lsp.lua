return {
	"williamboman/mason.nvim",
	cmd = { "Mason" },
	dependencies = {
		{ "RRethy/vim-illuminate" },
	},
	ft = { "*" },
	opts = {
		servers = {

			tsgo = {
				filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
				cmd = { "tsgo", "--lsp", "--stdio" },
				on_init = function(client)
					client.server_capabilities.semanticTokensProvider = nil
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
					client.server_capabilities.codeLensProvider = nil
					client.server_capabilities.documentHighlightProvider = false
				end,
			},

			biome = {
				single_file_support = true,
				cmd = { "biome", "lsp-proxy" },
				root_markers = { "biome.json", "biome.jsonc" },
			},

			-- deno = {
			-- 	cmd = { "deno", "lsp" },
			-- 	root_dir = vim.fs.root(0, { "deno.json", "deno.jsonc" }), -- detect Deno project
			-- 	init_options = {
			-- 		lint = true, -- enable linting
			-- 		unstable = true, -- allow unstable APIs
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
			},

			cssls = {
				cmd = { "vscode-css-language-server", "--stdio" },
				filetypes = { "css" },
			},

			cssmodules_ls = {
				cmd = { "cssmodules-language-server" },
				filetypes = { "css", "typescriptreact" },
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
				filetypes = { "go", "gomod", "gowork" },
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
