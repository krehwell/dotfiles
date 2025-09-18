return {
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

		sources = {
			default = { "emoji", "lsp", "snippets", "path", "buffer" },
			providers = {
				emoji = {
					module = "blink-emoji",
					name = "Emoji",
					score_offset = 15, -- Tune by preference
					opts = { insert = true }, -- Insert emoji (default) or complete its name
				},
				snippets = {
					-- hide snippet suggestion after dot(.)
					should_show_items = function(ctx)
						return ctx.trigger.initial_kind ~= "trigger_character"
					end,
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
			-- accept = { auto_brackets = { enabled = false } },
			list = {
				max_items = 30,
				selection = {
					--preselect = true,
					auto_insert = true,
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 100,
				treesitter_highlighting = true,
				window = {
					border = "rounded",
				},
			},
			menu = {
				draw = {
					padding = 1,
					gap = 2,
					treesitter = { "lsp" },
				},
				enabled = true,
			},
		},

		signature = { enabled = true },
	},
}
