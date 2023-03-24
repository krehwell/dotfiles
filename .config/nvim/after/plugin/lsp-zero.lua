local present, lsp = pcall(require, "lsp-zero")
local lspsetup = require("krehwell.lspsetup")
if not present then
	return
end

lsp.preset({
	name = "minimal",
	set_lsp_keymaps = true,
	manage_nvim_cmp = false,
})

-- LSP
lsp.ensure_installed({ "tsserver", "gopls", "cssls", "html", "cssmodules_ls", "jsonls" })

-- individual lsp config: sumneko_lua
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

-- individual lsp config: tsserver
lsp.configure("tsserver", {
	on_init = function(client)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentFormattingRangeProvider = false
	end,
	init_options = {
		hostInfo = "neovim",
		preferences = {
			autoImportFileExcludePatterns = {
				"node_modules/@*",
				"node_modules/**",
			},
		},
	},
	filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
})

lsp.set_preferences({
	set_lsp_keymaps = false,
	suggest_lsp_servers = false,
	sign_icons = { error = "", warn = "", hint = "H", info = "I" },
})

-- CMP
local cmp = require("cmp")
vim.opt.completeopt = { "menu", "menuone", "noselect" }
local cmp_config = lsp.defaults.cmp_config({
	window = {
		completion = cmp.config.window.bordered({}),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.scroll_docs(-4),
		["<C-j>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete({}),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),
	sources = {
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "nvim_lua" },
		{ name = "luasnip" },
		{ name = "path" },
		{ name = "calc" },
		{ name = "spell" },
	},
})
cmp.setup(cmp_config)

-- LSP KEYBINDING
lsp.on_attach(lspsetup.on_attach)

lsp.setup()

-- DIAGNOSTIC SETUP | must be at bottom most
vim.diagnostic.config(lspsetup.diagnostic_config)
