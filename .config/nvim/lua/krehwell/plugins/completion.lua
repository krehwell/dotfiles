return {
	"saghen/blink.cmp",
	event = "BufReadPre",
	version = "*",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"moyiz/blink-emoji.nvim",
		"onsails/lspkind.nvim",
		"joelazar/blink-calc",
	},

	config = function(_, opts)
		require("blink.cmp").setup(opts)
		-- Extend neovim's client capabilities with the completion ones.
		vim.lsp.config("*", { capabilities = require("blink.cmp").get_lsp_capabilities(nil, true) })
	end,

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = { preset = "enter" },
		cmdline = { enabled = true },

		sources = {
			default = { "lsp", "path", "snippets", "buffer", "calc", "emoji" },
			providers = {
				emoji = {
					module = "blink-emoji",
					name = "Emoji",
					-- score_offset = 15, -- Tune by preference
					opts = { insert = true }, -- Insert emoji (default) or complete its name
				},
				snippets = {
					enabled = true,
					-- hide snippet suggestion after dot(.)
					should_show_items = function(ctx)
						return ctx.trigger.initial_kind ~= "trigger_character"
					end,
				},
				calc = {
					name = "Calc",
					module = "blink-calc",
				},
			},
		},

		snippets = { preset = "luasnip" },

		signature = { enabled = true },

		completion = {
			accept = {
				auto_brackets = { enabled = false },
			},

			menu = {
				draw = {
					components = {
						kind_icon = {
							text = function(ctx)
								local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
								return kind_icon
							end,
							-- (optional) use highlights from mini.icons
							highlight = function(ctx)
								local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
								return hl
							end,
						},
						kind = {
							-- (optional) use highlights from mini.icons
							highlight = function(ctx)
								local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
								return hl
							end,
						},
					},
				},
			},
		},
	},
}
