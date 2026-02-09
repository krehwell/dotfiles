local jsts_settings = {
	preferences = {
		includePackageJsonAutoImports = "off",
		-- importModuleSpecifierPreference = "non-relative",
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
			"pspdfkit",
			"esbuild",
		},
		tsserver = { watchOptions = { excludeDirectories = { "node_modules", "dist", ".next", "out" } } },
	},
	updateImportsOnFileMove = { enabled = "always" },
}

return {
	"b0o/SchemaStore.nvim",
	cmd = { "Mason" },
	dependencies = {
		{ "williamboman/mason.nvim" },
	},
	ft = { "*" },
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
			},

			-- ts_ls = {
			-- 	filetypes = { "typescript", "javascript", "typescriptreact" },
			-- 	cmd = { "typescript-language-server", "--stdio" },
			-- 	on_init = function(client)
			-- 		client.server_capabilities.semanticTokensProvider = nil
			-- 		client.server_capabilities.documentFormattingProvider = false
			-- 		client.server_capabilities.documentRangeFormattingProvider = false
			-- 		client.server_capabilities.codeLensProvider = nil
			-- 		client.server_capabilities.documentHighlightProvider = false
			-- 	end,
			-- 	settings = { typescript = jsts_settings, javascript = jsts_settings },
			-- },

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
				settings = { typescript = jsts_settings, javascript = jsts_settings },
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
				on_init = function(client)
					client.config.settings.json.schemas = require("schemastore").json.schemas() -- typechecking for schema
					client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
				end,
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
