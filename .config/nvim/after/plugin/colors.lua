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

local colorscheme = "arthur"
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

-- CUSTOM ADDITIONAL COLOR CONFIG
vim.cmd([[
  augroup custom_off_highlight
    au!
    hi! Normal guibg=g:term_background " guifg=g:term_foreground ctermbg=NONE
    hi! VertSplit guibg=NONE guifg=NONE ctermbg=NONE ctermfg=NONE
    hi! SignColumn guibg=NONE
    " hi! link String Normal
    hi! TabLineFill guibg=NONE
    hi! TabLineSel guibg=NONE
    hi! Pmenu guibg=NONE guifg=Normal
    " hi! PmenuSel guifg=Normal
    " hi clear Todo
  augroup END
]])

-- CUSTOM ARTHUR COLOR CONFIG
if colorscheme == "arthur" then
	vim.cmd([[
    augroup custom_arthur
      au!
      hi! CmpItemMenuDefault guifg=Normal
      hi! CmpItemAbbrMatchDefault guifg=Normal gui=bold
      hi! link CmpItemAbbrDefault Normal
      hi! CmpItemAbbrMatchFuzzyDefault guifg=Normal gui=bold
      hi! IncSearch guifg=plum guibg=black
      hi! Search guifg=NONE guibg=teal
      hi! link CurSearch Search
    augroup END
  ]])

	-- CURSOR COLOR
	vim.cmd([[
    hi! Cursor guifg=white guibg=#ddeedd
    hi! iCursor guifg=white guibg=#ddeedd
    hi! vCursor guifg=red guibg=plum
    set guicursor=n-c:block-Cursor
    set guicursor+=v:block-vCursor
    set guicursor+=i:ver100-iCursor
    set guicursor+=n-v-c:blinkon0
    " set guicursor+=i:blinkwait0
    " set guicursor+=a:blinkon100
  ]])
end
