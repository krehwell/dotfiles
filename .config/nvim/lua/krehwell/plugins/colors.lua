-- vim.cmd("syntax off")
-- vim.opt.termguicolors = true
-- vim.opt.background = "dark"
vim.opt.fillchars = {
	vert = "│", -- alternatives │
	fold = " ",
	eob = "~", -- suppress ~ at EndOfBuffer
	diff = "╱", -- alternatives = ⣿ ░ ─
	msgsep = "‾",
	foldopen = "▾",
	foldsep = "│",
	foldclose = "▸",
	stlnc = "—",
	stl = "—",
}
vim.opt.laststatus = 0
vim.cmd([[ let &statusline='%#WinSeparator#' ]]) -- color the split window dashes

-- save local terminal color
-- vim.cmd([[
--     if exists('g:wezterm')
--         let g:term_foreground = get(g:wezterm, 'colors', {}).foreground
--         let g:term_background = get(g:wezterm, 'colors', {}).background
--     endif
--     if exists('g:kitty')
--         let g:term_foreground = get(g:kitty, 'colors', {}).foreground
--         let g:term_background = get(g:kitty, 'colors', {}).background
--     endif
-- ]])

return {
	"krehwell/colors",
	dev = true,
	dependencies = {
		{ "HoNamDuong/hybrid.nvim", priority = 1000 },
	},
	config = function()
		require("hybrid").setup({
			transparent = true,
			overrides = function(hl, c)
				hl.Normal = { fg = "#f2f2f2" }
				hl.NormalNC = { fg = "#f2f2f2" }
				-- hl.Boolean = { link = "Normal" }
				-- hl.Character = { link = "Normal" }
				-- hl.ColorColumn = { link = "Normal" }
				-- hl.Conceal = { link = "Normal" }
				-- hl.Conditional = { link = "Normal" }
				-- hl.Constant = { link = "Normal" }
				-- hl.Define = { link = "Normal" }
				-- hl.Delimiter = { link = "Normal" }
				-- hl.Directory = { link = "Normal" }
				-- hl.Exception = { link = "Normal" }
				-- hl.Float = { link = "Normal" }
				-- hl.Function = { link = "Normal" }
				-- hl.Identifier = { link = "Normal" }
				-- hl.Include = { link = "Normal" }
				-- hl.Keyword = { link = "Normal" }
				-- hl.Macro = { link = "Normal" }
				-- hl.Normal = { link = "Normal" }
				-- hl.Number = { link = "Normal" }
				-- hl.Operator = { link = "Normal" }
				-- hl.Special = { link = "Normal" }
				-- hl.SpecialChar = { link = "Normal" }
				-- hl.SpellBad = { link = "Normal" }
				-- hl.Statement = { link = "Normal" }
				-- hl.PreCondit = { link = "Normal" }
				-- hl.PreProc = { link = "Normal" }
				-- hl.Type = { link = "Normal" }
				-- hl.Typedef = { link = "Normal" }
				-- hl.String = { link = "Normal" }

				-- hl.DiffAdd = { link = "Normal" }
				-- hl.DiffChange = { link = "Normal" }
				-- hl.DiffDelete = { link = "Normal" }
				-- hl.DiffText = { link = "Normal" }
				-- hl.Cursor = { link = "Normal" }
				-- hl.CursorColumn = { link = "Normal" }
				-- hl.CursorLine = { link = "Normal" }
				-- hl.CursorLineNr = { link = "Normal" }
				-- hl.CursorLineSign = { link = "Normal" }
				-- hl.Debug = { link = "Normal" }
				-- hl.Label = { link = "Normal" }
				-- hl.LineNr = { link = "Normal" }
				-- hl.MatchParen = { link = "Normal" }
				-- hl.NonText = { link = "Normal" }
				-- hl.Comment = { link = "Normal" }
				-- hl.SpecialComment = { link = "Normal" }
				-- hl.SpecialKey = { link = "Normal" }
				-- hl.FoldColumn = { link = "Normal" }
				-- hl.Folded = { link = "Normal" }
				-- hl.Error = { link = "Normal" }
				-- hl.ErrorMsg = { link = "Normal" }
			end,
		})
		vim.cmd.colorscheme("hybrid")
	end,
}
