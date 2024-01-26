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

local colorscheme = "mirec"
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

-- COLORS MOD
vim.cmd([[
  augroup custom_highlight
    " au!
    " hi! Normal guibg=g:term_background " guifg=g:term_foreground ctermbg=NONE
    " hi! VertSplit guibg=NONE guifg=NONE ctermbg=NONE ctermfg=NONE
    " hi! SignColumn guibg=NONE
    " hi! Pmenu guibg=NONE guifg=Normal
      hi! link TabLine LineNr
      hi! link TabLineFill LineNr
      hi! link FloatBorder Normal
      hi! link LspInfoBorder Normal
      hi! link NormalFloat Normal

      set guicursor=n-c-v:block-Cursor
      set guicursor+=v:block-vCursor
      set guicursor+=a:blinkon0
      set guicursor+=n:blinkon80
  augroup END
]])

-- COLORS MOD on `colorscheme === mirec`
if colorscheme == "mirec" then
	vim.cmd([[
    augroup custom_mirec
      au!
    augroup END
  ]])
end
