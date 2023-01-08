local present, lsp = pcall(require, "lsp-zero")
local lspsetup = require("krehwell.lspsetup")
if not present then
	return
end

lsp.preset("recommended")

lsp.ensure_installed({ "tsserver", "sumneko_lua", "gopls", "cssls", "html", "cssmodules_ls", "jsonls" })

-- FIX UNDEFINED GLOBAL 'vim'
require("neodev").setup({}) -- no need pcall since I really is want this to be installed
lsp.configure("sumneko_lua", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
		workspace = {
			library = vim.api.nvim_get_runtime_file("", true),
		},
		telemetry = {
			enable = false,
		},
	},
})

-- configure an individual server
-- lsp.configure("tsserver", {
-- 	flags = {
-- 		debounce_text_changes = 5000,
-- 	},
-- 	init_options = {
-- 		hostInfo = "neovim",
-- 		preferences = {
-- 			autoImportFileExcludePatterns = { "node_modules/@*" },
-- 		},
-- 	},
-- 	on_attach = function(client, bufnr)
-- 		client.server_capabilities.document_formatting = false
-- 	end,
-- })

lsp.set_preferences({
	set_lsp_keymaps = false,
	suggest_lsp_servers = false,
	sign_icons = {}, -- { error = "E", warn = "W", hint = "H", info = "I" },
})

-- COMPLETION SETUP
local cmp = require("cmp")
lsp.setup_nvim_cmp({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.scroll_docs(-4),
		["<C-j>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete({}),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	}, {
		{ name = "buffer" },
	}),
})

-- LSP KEYBINDING
lsp.on_attach(lspsetup.on_attach)

lsp.setup()

-- DIAGNOSTIC SETUP | must be at bottom most
vim.diagnostic.config(lspsetup.diagnostic_config)
