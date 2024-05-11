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
				["<CR>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert }),
				-- ["<CR>"] = cmp.config.disable,
			}),

			-- CMP APPEARANCE
			formatting = {
				expandable_indicator = true,
				fields = { "kind", "abbr", "menu" },
				format = function(entry, item)
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
					})(entry, item)

					local s = vim.split(kind.kind, "%s", { trimempty = true })
					local symbol = " " .. s[1] .. " "
					if entry.source.name == "calc" then
						symbol = " 󰃬 "
					end
					local menu = " " .. s[2]

					kind.kind = symbol
					kind.menu = menu
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
		})
	end,
}
