-- vim.cmd("syntax off")
-- vim.opt.termguicolors = true
vim.opt.background = "dark"

return {
	"krehwell/colors",
	dev = true,
	dependencies = {
		{ "vague2k/vague.nvim" },
	},

	config = function()
		require("vague").setup({
			transparent = false, -- don't set background
			style = {
				-- "none" is the same thing as default. But "italic" and "bold" are also valid options
				boolean = "none",
				number = "none",
				float = "none",
				error = "none",
				comments = "italic",
				conditionals = "none",
				functions = "none",
				headings = "bold",
				operators = "none",
				strings = "italic",
				variables = "none",

				-- keywords
				keywords = "none",
				keyword_return = "none",
				keywords_loop = "none",
				keywords_label = "none",
				keywords_exception = "none",

				-- builtin
				builtin_constants = "none",
				builtin_functions = "none",
				builtin_types = "none",
				builtin_variables = "none",
			},
			-- Override colors
			colors = {
				bg = "#18191a",
				fg = "#cdcdcd",
				floatBorder = "#cdcdcd",
				line = "#282830",
				comment = "#646477",
				builtin = "#cdcdcd",
				func = "#cdcdcd",
				string = "#cdcdcd",
				number = "#cdcdcd",
				property = "#cdcdcd",
				constant = "#cdcdcd",
				parameter = "#cdcdcd",
				visual = "#363738",
				error = "#d2788c",
				warning = "#e6be8c",
				hint = "#8ca0dc",
				operator = "#cdcdcd",
				keyword = "#cdcdcd",
				type = "#cdcdcd",
				search = "#465362",
				plus = "#cdcdcd",
				delta = "#cdcdcd",
			},
		})

		vim.cmd([[ colorscheme vague ]])
		vim.cmd([[ let &statusline='%#WinSeparator#' ]]) -- color the split window dashes
	end,
}
