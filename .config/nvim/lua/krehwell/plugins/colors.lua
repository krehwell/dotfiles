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

local colorscheme = vim.g.colors_name

-- save local terminal color
vim.cmd([[
    if exists('g:wezterm')
        let g:term_foreground = get(g:wezterm, 'colors', {}).foreground
        let g:term_background = get(g:wezterm, 'colors', {}).background
    endif
    if exists('g:kitty')
        let g:term_foreground = get(g:kitty, 'colors', {}).foreground
        let g:term_background = get(g:kitty, 'colors', {}).background
    endif
]])

-- COLORS MOD
vim.cmd([[
    augroup custom_highlight
        " au!
        " hi! Normal guibg=g:term_background guifg=g:term_foreground
        " hi! VertSplit guibg=NONE guifg=NONE ctermbg=NONE ctermfg=NONE
        " hi! SignColumn guibg=NONE
        " hi! Pmenu guibg=NONE guifg=Normal
        " hi! link TabLine LineNr
        " hi! link TabLineFill LineNr
        " hi! link FloatBorder Normal
        " hi! link LspInfoBorder Normal
        " hi! link NormalFloat Normal

        " set guicursor=n-c-v:block-Cursor
        " set guicursor+=v:block-vCursor
        " set guicursor+=a:blinkon0
        " set guicursor+=n:blinkon80
    augroup END
]])

return {
	"krehwell/colors",
	dev = true,
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
				-- hl.Error = { link = "Normal" }
				-- hl.ErrorMsg = { link = "Normal" }
				-- hl.Exception = { link = "Normal" }
				-- hl.Float = { link = "Normal" }
				-- hl.FoldColumn = { link = "Normal" }
				-- hl.Folded = { link = "Normal" }
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
				-- hl.SpecialComment = { link = "Normal" }
				-- hl.SpecialKey = { link = "Normal" }
				-- hl.Comment = { link = "Normal" }
			end,
		})
		vim.cmd.colorscheme("hybrid")
	end,
}
