return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		{ "hrsh7th/cmp-calc" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-cmdline" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp" },
		-- { "rafamadriz/friendly-snippets" },
		{ "onsails/lspkind.nvim" },
	},
	config = function()
		local cmp = require("cmp")
		-- require("luasnip.loaders.from_vscode").lazy_load()

		-- CMP IN CMD MODE
		-- cmp.setup.cmdline(":", {
		-- 	mapping = cmp.mapping.preset.cmdline(),
		-- 	sources = cmp.config.sources({
		-- 		{ name = "path" },
		-- 	}, {
		-- 		{
		-- 			name = "cmdline",
		-- 			option = {
		-- 				ignore_cmds = { "Man", "!" },
		-- 			},
		-- 		},
		-- 	}),
		-- })

		-- CMP IN "/" and "?"
		-- cmp.setup.cmdline("/", {
		-- 	view = {
		-- 		entries = { name = "wildmenu", separator = " | " },
		-- 	},
		-- 	mapping = cmp.mapping.preset.cmdline(),
		-- 	sources = { { name = "buffer" } },
		-- })

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.scroll_docs(-4),
				["<C-j>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete({}),
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<Tab>"] = cmp.config.disable,
				["<S-Tab>"] = cmp.config.disable,
				["<CR>"] = cmp.mapping.confirm({
					select = true,
					behavior = cmp.ConfirmBehavior.Replace,
				}),
				-- ["<CR>"] = cmp.config.disable,
			}),

			-- CMP APPEARANCE
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					local kind = require("lspkind").cmp_format({
						mode = "symbol_text",
						maxwidth = 50,
						symbol_map = {
							Text = "",
							Method = "m",
							Function = "󰊕",
							Constructor = "",
							Field = "",
							Variable = "",
							Class = "",
							Interface = "",
							Module = "",
							Property = " ",
							Unit = "",
							Value = "󰎠",
							Enum = "",
							Keyword = "󰌋",
							Snippet = "",
							Color = "󰏘",
							File = "󰈙",
							Reference = "",
							Folder = "󰉋",
							EnumMember = "",
							Constant = "󰏿",
							Struct = "",
							Event = "",
							Operator = "󰆕",
							TypeParameter = "",
						},
					})(entry, vim_item)
					local strings = vim.split(kind.kind, "%s", { trimempty = true })

					kind.kind = " " .. (strings[1] or "") .. " "
					if entry.source.name == "calc" then
						kind.kind = " 󰃬 "
					end

					-- kind.kind = '▍' -- instead of symbol
					kind.menu = " " .. (strings[2] or "")
					return kind
				end,
			},
			window = {
				documentation = cmp.config.window.bordered(),
				completion = { col_offset = -3, side_padding = 0 },
			},
			view = {
				-- entries = "native",
			},
			experimental = {
				-- ghost_text = true,
			},

			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				-- { name = "luasnip" },
				{ name = "path" },
				{ name = "calc" },
			}, {
				{ name = "buffer" },
			}),
			duplicates = {
				nvim_lsp = 1,
				-- luasnip = 1,
				buffer = 1,
				path = 1,
			},
			performance = {
				-- debounce = 50,
				-- throttle = 50,
				-- fetching_timeout = 50,
				-- max_view_entries = 20,
			},
		})
	end,
}
