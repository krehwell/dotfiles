return {
	"saghen/blink.cmp",
	event = "BufReadPre",
	version = "*",
	dependencies = { "rafamadriz/friendly-snippets", "joelazar/blink-calc" },

	config = function(_, opts)
		require("blink.cmp").setup(opts)
		vim.lsp.config("*", { capabilities = require("blink.cmp").get_lsp_capabilities(nil, true) }) -- Extend neovim's client capabilities with the completion ones.
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
		},
	},
}
