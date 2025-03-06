local blink = {
	"saghen/blink.cmp",
	event = "BufReadPre",
	version = "*",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"moyiz/blink-emoji.nvim",
	},

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = { preset = "enter" },
		cmdline = { enabled = true },
		appearance = { use_nvim_cmp_as_default = true },
		fuzzy = { implementation = "prefer_rust_with_warning" },

		sources = {
			default = { "emoji", "snippets", "lsp", "path", "buffer" },
			providers = {
				emoji = {
					module = "blink-emoji",
					name = "Emoji",
					score_offset = 15, -- Tune by preference
					opts = { insert = true }, -- Insert emoji (default) or complete its name
				},
			},
		},

		snippets = { preset = "luasnip" },

		completion = {
			trigger = {
				prefetch_on_insert = true,
			},
			keyword = {
				range = "prefix",
			},
			accept = { auto_brackets = { enabled = true } },
			list = {
				-- max_items = 30,
				selection = { preselect = true, auto_insert = true },
			},
			documentation = {
				auto_show = true,
				-- auto_show_delay_ms = 200,
			},
			menu = { draw = { padding = 1, gap = 2 }, enabled = true },
		},

		signature = { enabled = true },
	},
}

return blink
