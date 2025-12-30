return {
	"numToStr/Comment.nvim",
	dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
	event = "InsertEnter",
	opts = function()
		-- allow comment on react .jsx file
		require("ts_context_commentstring").setup({ enable_autocmd = false })
		vim.g.skip_ts_context_commentstring_module = true
		return {
			ignore = "^$", -- ignore empty lines
			mappings = { extra = nil },
			-- allow comment on react .jsx file
			pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
		}
	end,
	keys = {
		{ "gcc", mode = "n", desc = "Comment current line" },
		{ "gc", mode = { "n", "v" }, desc = "Comment selection" },
	},
}
