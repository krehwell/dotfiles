-- vim.cmd("syntax off")
-- vim.opt.background = "dark"
-- vim.opt.termguicolors = true
vim.opt.fillchars = {
	vert = "╏", -- alternatives │
	fold = " ",
	eob = "~", -- suppress ~ at EndOfBuffer
	diff = "╱", -- alternatives = ⣿ ░ ─
	msgsep = "‾",
	foldopen = "▾",
	foldsep = "│",
	foldclose = "▸",
	stlnc = "‐",
	stl = "_",
}
vim.opt.laststatus = 0
vim.cmd([[ let &statusline='%#VertSplit#' ]]) -- color the split window dashes

-- local c = require("vscode.colors").get_colors()
-- require("vscode").setup({
--   -- Enable transparent background
--   transparent = true,
--   -- Enable italic comment
--   italic_comments = true,
--   -- Override highlight groups (see ./lua/vscode/theme.lua)
--   group_overrides = {
--     -- this supports the same val table as vim.api.nvim_set_hl
--     -- use colors from this colorscheme by requiring vscode.colors!
--     Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
--   },
-- })
-- require("vscode").load()

local colorscheme = "yami"
local present, _ = pcall(vim.api.nvim_command, "colorscheme " .. colorscheme)
if not present then
	return print("colorscheme " .. colorscheme .. " not found!")
end

-- save local wazeterm color
vim.cmd([[
  if exists('g:wezterm')
    let g:term_foreground = get(g:wezterm, 'colors', {}).foreground
    let g:term_background = get(g:wezterm, 'colors', {}).background
  endif
]])

vim.cmd([[
  augroup custom_off_highlight
    au!
    hi! Normal guibg=g:term_background guifg=g:term_foreground ctermbg=NONE
    hi! VertSplit guibg=NONE guifg=NONE ctermbg=NONE ctermfg=NONE
    hi! SignColumn guibg=NONE
    hi! link String Normal
    hi! link TabLineFill Normal
    hi! TabLineSel guibg=#a270ba guifg=#1e1e1e
    " hi! Pmenu guibg=#NONE
    " hi! PmenuSel guifg=#ffffff
    " hi clear Todo
  augroup END
]])
