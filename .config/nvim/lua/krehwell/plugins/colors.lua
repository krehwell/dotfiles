-- vim.cmd("syntax off")
-- vim.opt.termguicolors = true
-- vim.opt.background = "dark"

vim.cmd([[ let &statusline='%#WinSeparator#' ]]) -- color the split window dashes

return {
	"krehwell/colors",
	dev = true,
	enabled = true,
	dependencies = {
		{ "HoNamDuong/hybrid.nvim" },
	},
	config = function()
		require("hybrid").setup({
			transparent = true,
			overrides = function(hl, c)
				hl.Normal = { fg = "#f2f2f2" }
				hl.NormalNC = { link = "Normal" }
				hl.Boolean = { link = "Normal" }
				hl.Character = { link = "Normal" }
				hl.Conditional = { link = "Normal" }
				hl.Constant = { link = "Normal" }
				hl.Define = { link = "Normal" }
				hl.Delimiter = { link = "Normal" }
				hl.Exception = { link = "Normal" }
				hl.Float = { link = "Normal" }
				hl.Function = { link = "Normal" }
				hl.Identifier = { link = "Normal" }
				hl.Include = { link = "Normal" }
				hl.Macro = { link = "Normal" }
				hl.Keyword = { link = "Normal" }
				hl.Normal = { link = "Normal" }
				hl.Number = { link = "Normal" }
				hl.Operator = { link = "Normal" }
				hl.Special = { link = "Normal" }
				hl.SpecialChar = { link = "Normal" }
				hl.SpellBad = { link = "Normal" }
				hl.Statement = { link = "Normal" }
				hl.PreCondit = { link = "Normal" }
				hl.PreProc = { link = "Normal" }
				hl.Type = { link = "Normal" }
				hl.Typedef = { link = "Normal" }
				hl.String = { link = "Normal" }
				hl.SpecialKey = { link = "Normal" }
				hl.Tag = { link = "Normal" }
				hl.TabLine = { bg = "#151718", fg = "#707880" }
				-- hl.TabLineSel = { bg = "#f0c674", fg = "#1d1f21" }
				-- hl.Conceal = { link = "Normal" }
			end,
		})

		vim.cmd.colorscheme("hybrid")
	end,
}
