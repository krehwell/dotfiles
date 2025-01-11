local blink = {
	"saghen/blink.cmp",
	event = "BufReadPre",
	version = "v0.*",
	dependencies = { "rafamadriz/friendly-snippets", "moyiz/blink-emoji.nvim" },
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = "enter",
		},

		sources = {
			default = { "lazydev", "emoji", "lsp", "path", "snippets", "buffer" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},
				emoji = {
					module = "blink-emoji",
					name = "Emoji",
					score_offset = 15, -- Tune by preference
					opts = { insert = true }, -- Insert emoji (default) or complete its name
				},
			},

			cmdline = function()
				local type = vim.fn.getcmdtype()
				if type == "/" or type == "?" then
					return { "buffer" }
				end
				if type == ":" then
					return { "cmdline" }
				end
				return {}
			end,
		},

		completion = {
			trigger = {
				prefetch_on_insert = true,
			},
			keyword = {
				range = "full",
			},
			accept = { auto_brackets = { enabled = true } },
			list = {
				max_items = 100,
				selection = { preselect = true, auto_insert = true },
			},
			documentation = {
				auto_show = true,
			},
			menu = {
				draw = {
					padding = 1,
					gap = 2
				},
				auto_show = function(ctx)
					if ctx.mode == "cmdline" then
						return false
					elseif vim.tbl_contains({ "/", "?" }, vim.fn.getcmdtype()) then
						return false
					end
					return true
				end,
				enabled = true,
			},
		},

		signature = {
			enabled = true,
		},
	},
}

return blink
