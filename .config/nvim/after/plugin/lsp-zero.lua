local present, lsp = pcall(require, "lsp-zero")
local lspsetup = require("krehwell.lspsetup")
if not present then
	return
end

lsp.preset("recommended")

-- LSP
lsp.ensure_installed({ "tsserver", "sumneko_lua", "gopls", "cssls", "html", "cssmodules_ls", "jsonls" })

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
			autoImportFileExcludePatterns = { "node_modules/@*" },
		},
	},
	filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
	settings = {
		implicitProjectConfig = {
			checkJs = true,
			enableImplicitProjectConfig = true,
		},
	},
})

lsp.set_preferences({
	set_lsp_keymaps = false,
	suggest_lsp_servers = false,
	sign_icons = { error = "", warn = "", hint = "H", info = "I" },
})

-- CMP
local cmp = require("cmp")
lsp.setup_nvim_cmp({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	documentation = {
		-- border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		-- winhighlight = 'Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None',
		-- max_height = 20,
		-- max_width = 60,
		-- border = "rounded",
		-- zindex = 1001,
	},
	formatting = {
		-- fields = { "menu", "abbr", "kind" }, -- of fields so the icon is the first
		-- format = function(entry, item)
		-- 	local menu_icon = {
		-- 		nvim_lsp = "λ",
		-- 		luasnip = "⋗",
		-- 		buffer = "Ω",
		-- 		path = "🖫",
		-- 		nvim_lua = "Π",
		-- 	}
		-- 	item.menu = menu_icon[entry.source.name]
		-- 	return item
		-- end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
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

-- LSP KEYBINDING
lsp.on_attach(lspsetup.on_attach)

lsp.setup()

-- DIAGNOSTIC SETUP | must be at bottom most
vim.diagnostic.config(lspsetup.diagnostic_config)
