return {
	"echasnovski/mini.comment",
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
		config = function()
			require("ts_context_commentstring").setup({ enable_autocmd = false })
		end,
	},
	event = "InsertEnter",
	opts = {
		options = {
			custom_commentstring = function()
				return require("ts_context_commentstring").calculate_commentstring() or vim.bo.commentstring
			end,

			-- Whether to ignore blank lines when commenting
			ignore_blank_line = true,

			-- Whether to recognize as comment only lines without indent
			start_of_line = false,

			-- Whether to force single space inner padding for comment parts
			pad_comment_parts = true,
		},

		-- Module mappings. Use `''` (empty string) to disable one.
		mappings = {
			-- Toggle comment (like `gcip` - comment inner paragraph) for both
			-- Normal and Visual modes
			comment = "gc",

			-- Toggle comment on current line
			comment_line = "gcc",

			-- Toggle comment on visual selection
			comment_visual = "gc",

			-- Define 'comment' textobject (like `dgc` - delete whole comment block)
			-- Works also in Visual mode if mapping differs from `comment_visual`
			textobject = "gc",
		},
	},
}
