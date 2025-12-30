vim.opt.termguicolors = true
vim.opt.background = "dark"

local dim_my_highlights = function()
	vim.api.nvim_set_hl(0, "NoSyntaxColoring", { fg = "NvimLightGray2" })

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalNC", { link = "Normal" })
	vim.api.nvim_set_hl(0, "Module", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "Constant", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "String", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "Character", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "Number", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "Boolean", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "Float", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "Operator", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "Identifier", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "Function", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "Statement", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "Conditional", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "Repeat", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "Label", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "Keyword", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "Exception", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "PreProc", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "Include", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "Define", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "Macro", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "PreCondit", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "Type", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "StorageClass", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "Structure", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "Typedef", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "Special", { link = "NoSyntaxColoring" })

	vim.api.nvim_set_hl(0, "TabLineSel", { link = "DiffText" })
end

return {
	"Verf/deepwhite.nvim",
	config = function()
		vim.cmd([[ let &statusline='%#WinSeparator#' ]]) -- color the split window dashes

		vim.api.nvim_create_autocmd({ "VimEnter" }, {
			group = vim.api.nvim_create_augroup("krehwell/dim_my_highlights", { clear = true }),
			desc = "I don't like colorscheme, turn off all highlighting",
			callback = function()
				dim_my_highlights()
			end,
		})

		vim.cmd("colorscheme default")
	end,
}
