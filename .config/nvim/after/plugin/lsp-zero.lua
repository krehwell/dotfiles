local present, lsp = pcall(require, "lsp-zero")
local lspsetup = require("krehwell.lspsetup")
if not present then
	return
end

lsp.preset({
	name = "minimal",
	set_lsp_keymaps = false,
	suggest_lsp_servers = false,
	manage_nvim_cmp = false,
})
-- lsp.set_preferences({
-- 	sign_icons = { error = "", warn = "", hint = "H", info = "I" },
-- })

lsp.set_server_config({
	on_init = function(client)
		client.server_capabilities.semanticTokensProvider = nil
	end,
})

-- LSP
lsp.ensure_installed({ "tsserver", "gopls", "cssls", "html", "cssmodules_ls", "jsonls" })

-- individual lsp config: sumneko_lua
require("neodev").setup({}) -- no need pcall since I really is want this to be installed
lsp.configure("lua_ls", {
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
			importModuleSpecifierPreference = "non-relative", -- always prefer alias import from project relative
		},
	},
	filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
})

-- CMP
local cmp = require("cmp")
local merge = function(a, b)
	return vim.tbl_deep_extend("force", {}, a, b)
end
local cmp_config = lsp.defaults.cmp_config({
	preselect = cmp.PreselectMode.Item,
	completion = {
		completeopt = "menu,menuone,noinsert",
	},
	window = {
		completion = cmp.config.window.bordered({}),
		documentation = merge(cmp.config.window.bordered(), {
			max_height = 15,
			max_width = 40,
		}),
	},
	formatting = {
		fields = { "abbr", "menu", "kind" },
		format = function(entry, item)
			local short_name = {
				nvim_lsp = "LSP",
				nvim_lua = "nvim",
				nvim_lsp_signature_help = "signature",
			}

			local menu_name = short_name[entry.source.name] or entry.source.name

			item.menu = string.format("[%s]", menu_name)
			return item
		end,
	},
	mapping = {
		["<C-k>"] = cmp.mapping.scroll_docs(-4),
		["<C-j>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete({}),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		-- ["<CR>"] = cmp.config.disable,
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<Tab>"] = cmp.config.disable,
		["<S-Tab>"] = cmp.config.disable,
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "nvim_lsp_signature_help" },
		{ name = "nvim_lua" },
		{ name = "path" },
		{ name = "calc" },
		-- { name = "luasnip" },
		-- { name = "spell" },
	}, {
		{ name = "buffer" },
	}),
})
cmp.setup(cmp_config)

-- LSP KEYBINDING
lsp.on_attach(lspsetup.on_attach)

lsp.setup()

-- DIAGNOSTIC SETUP | must be at bottom most
vim.diagnostic.config(lspsetup.diagnostic_config)
