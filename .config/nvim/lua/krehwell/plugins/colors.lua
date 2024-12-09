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
				floatBorder = "#878787",
				line = "#282830",
				comment = "#646477",
				builtin = "#cdcdcd",
				func = "#cdcdcd",
				string = "#cdcdcd",
				number = "#cdcdcd",
				property = "#c7c7d4",
				constant = "#cdcdcd",
				parameter = "#b9a3ba",
				visual = "#363738",
				error = "#d2788c",
				warning = "#e6be8c",
				hint = "#8ca0dc",
				operator = "#96a3b2",
				keyword = "#cdcdcd",
				type = "#cdcdcd",
				search = "#465362",
				plus = "#8faf77",
				delta = "#e6be8c",
			},
		})

		vim.cmd([[ colorscheme vague ]])

		vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { bg = "NONE", strikethrough = true, fg = "#808080" })
		-- blue
		vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { bg = "NONE", fg = "#8ca0dc", bold = true })
		vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { link = "CmpIntemAbbrMatch", bold = true })
		-- light blue
		vim.api.nvim_set_hl(0, "CmpItemKindVariable", { bg = "NONE", fg = "#9CDCFE" })
		vim.api.nvim_set_hl(0, "CmpItemKindInterface", { link = "CmpItemKindVariable" })
		vim.api.nvim_set_hl(0, "CmpItemKindText", { link = "CmpItemKindVariable" })
		-- pink
		vim.api.nvim_set_hl(0, "CmpItemKindFunction", { bg = "NONE", fg = "#b9a3ba" })
		vim.api.nvim_set_hl(0, "CmpItemKindMethod", { link = "CmpItemKindFunction" })
		-- front
		vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { bg = "NONE", fg = "#D4D4D4" })
		vim.api.nvim_set_hl(0, "CmpItemKindProperty", { link = "CmpItemKindKeyword" })
		vim.api.nvim_set_hl(0, "CmpItemKindUnit", { link = "CmpItemKindKeyword" })

		vim.cmd([[ let &statusline='%#WinSeparator#' ]]) -- color the split window dashes
	end,
}
