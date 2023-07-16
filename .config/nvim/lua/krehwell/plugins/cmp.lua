return {
	"hrsh7th/nvim-cmp",
  event="VeryLazy",
	dependencies = {
		{ "hrsh7th/cmp-calc" },
		{ "hrsh7th/cmp-path" },
		-- { "hrsh7th/cmp-nvim-lsp-signature-help" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "L3MON4D3/LuaSnip" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "rafamadriz/friendly-snippets" },
		{ "hrsh7th/cmp-buffer" },
	},
	opts = function()
		local cmp = require("cmp")
		local merge = function(a, b)
			return vim.tbl_deep_extend("force", {}, a, b)
		end
		require("luasnip.loaders.from_vscode").lazy_load()

		vim.api.nvim_exec(
			[[
          " press <Tab> to expand or jump in a snippet. These can also be mapped separately
          " via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
          imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
          " -1 for jumping backwards.
          inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

          " snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
          " snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

          " For changing choices in choiceNodes (not strictly necessary for a basic setup).
          imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
          smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
      ]],
			false
		)

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
					require("luasnip").lsp_expand(args.body)
				end,
			},
			formatting = {
				fields = { "abbr", "menu", "kind" },
				format = function(entry, item)
					local short_name = { nvim_lsp = "LSP", nvim_lua = "nvim", nvim_lsp_signature_help = "signature" }
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
				{ name = "nvim_lua" },
				{ name = "luasnip" },
				-- { name = "nvim_lsp_signature_help" },
				{ name = "path" },
				{ name = "calc" },
				-- { name = "spell" },
			}, {
				{ name = "buffer" },
			}),
		}
	end,
}
