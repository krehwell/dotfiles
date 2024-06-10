return {
	"echasnovski/mini.comment",
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
		config = function()
			require("ts_context_commentstring").setup({ enable_autocmd = false })
		end,
	},
	event = "BufReadPre",
	opts = {
		options = {
			custom_commentstring = function()
				return require("ts_context_commentstring").calculate_commentstring() or vim.bo.commentstring
			end,
			ignore_blank_line = true,
			start_of_line = false,
			pad_comment_parts = true,
		},

		-- Module mappings. Use `''` (empty string) to disable one.
		mappings = {
			comment = "gc",
			comment_line = "gcc",
			comment_visual = "gc",
			textobject = "gc",
		},
	},
}
