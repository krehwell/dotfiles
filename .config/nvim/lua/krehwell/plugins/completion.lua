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
					-- make lazydev completions top priority (see `:h blink.cmp`)
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

			min_keyword_length = function()
				local type = vim.fn.getcmdtype()
				if type == "/" or type == "?" then
					return 15
				end
				if type == ":" then
					return 3
				end
				return 0
			end,
		},

		completion = {
			trigger = {
				prefetch_on_insert = true,
			},
			keyword = {
				range = "prefix",
			},
			accept = { auto_brackets = { enabled = true } },
			list = {
				max_items = 100,
				selection = { preselect = true, auto_insert = true },
			},
			documentation = {
				auto_show = true,
				-- auto_show_delay_ms = 200,
			},
			menu = {
				draw = {
					padding = 1,
					gap = 2,
				},
				auto_show = function(ctx)
					if ctx.mode == "cmdline" then
						return true
					elseif vim.tbl_contains({ "/", "?" }, vim.fn.getcmdtype()) then
						return true
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
