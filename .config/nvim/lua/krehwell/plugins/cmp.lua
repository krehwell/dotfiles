return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		{ "hrsh7th/cmp-calc" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-vsnip" },
		{ "hrsh7th/vim-vsnip" },
		{ "hrsh7th/cmp-buffer" },
	},
	opts = function()
		local cmp = require("cmp")
		local merge = function(a, b)
			return vim.tbl_deep_extend("force", {}, a, b)
		end

		return {
			preselect = cmp.PreselectMode.Item,
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			window = {
				completion = cmp.config.window.bordered({}),
				documentation = merge(cmp.config.window.bordered(), { max_height = 15, max_width = 40 }),
			},
			snippet = {
				expand = function(args)
					vim.fn["vsnip#anonymous"](args.body)
				end,
			},
			formatting = {
				fields = { "abbr", "menu", "kind" },
				-- format = function(entry, item)
				--   local short_name = { nvim_lsp = "LSP", nvim_lua = "nvim", nvim_lsp_signature_help = "signature" }
				--   local menu_name = short_name[entry.source.name] or entry.source.name
				--   item.menu = string.format("[%s]", menu_name)
				--   return item
				-- end,
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
				{ name = "path" },
				{ name = "calc" },
      }, {
				{ name = "buffer" },
			}),
		}
	end,
}
