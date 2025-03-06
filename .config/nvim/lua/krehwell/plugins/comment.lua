return {
	"numToStr/Comment.nvim",
	dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
	event = "InsertEnter",
	opts = function()
		require("ts_context_commentstring").setup({ enable_autocmd = false })
		vim.g.skip_ts_context_commentstring_module = true
		return {
			ignore = "^$", -- ignore empty lines
			toggler = { line = "gcc", block = nil },
			opleader = { line = "gc", block = nil },
			mappings = {
				basic = true, -- Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
				extra = nil,
			},
			pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			post_hook = nil,
		}
	end,
	keys = {
		{ "gcc", mode = "n", desc = "Comment current line" },
		{ "gc", mode = { "n", "v" }, desc = "Comment selection" },
	},
}
