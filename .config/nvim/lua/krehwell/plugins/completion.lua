return {
	"saghen/blink.cmp",
	event = "BufReadPre",
	version = "*",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"joelazar/blink-calc",
		{
			"nvim-mini/mini.snippets",
			config = function()
				require("mini.snippets").setup({
					snippets = { require("mini.snippets").gen_loader.from_lang() },
				})
			end,
		},
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
			default = { "lsp", "path", "snippets", "buffer", "calc" },
			providers = {
				snippets = {
					enabled = true,
					should_show_items = function(ctx)
						return ctx.trigger.initial_kind ~= "trigger_character" -- hide snippet suggestion after dot(.)
					end,
				},
				calc = { name = "Calc", module = "blink-calc" },
			},
		},

		snippets = { preset = "mini_snippets" },

		signature = { enabled = true },

		completion = {
			accept = { auto_brackets = { enabled = false } },
		},
	},
}
