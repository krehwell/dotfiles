-- vim.opt.background = "dark"
-- vim.opt.termguicolors = true
vim.opt.fillchars = {
	vert = "┆", -- alternatives │
	fold = " ",
	eob = "~", -- suppress ~ at EndOfBuffer
	diff = "╱", -- alternatives = ⣿ ░ ─
	msgsep = "‾",
	foldopen = "▾",
	foldsep = "│",
	foldclose = "▸",
}

-- OFF COLORSCHEME PRECONFIGURATION
vim.g.colors_off_a_little = 1
vim.g.monochrome_italic_comments = 1

local colorscheme = "off"
local present, _ = pcall(vim.api.nvim_command, "colorscheme " .. colorscheme)
if not present then
	return print("colorscheme " .. colorscheme .. " not found!")
end

-- save local wazeterm color
vim.api.nvim_exec(
	[[
    if exists('g:wezterm')
      let g:term_foreground = get(g:wezterm, 'colors', {}).foreground
      let g:term_background = get(g:wezterm, 'colors', {}).background
    endif
  ]],
	false
)

if colorscheme == "off" then
	vim.api.nvim_exec(
		[[
        augroup custom_off_highlight
          au!
          hi! Normal guibg=g:term_background guifg=g:term_foreground ctermbg=NONE
          hi! VertSplit guibg=NONE guifg=NONE ctermbg=NONE ctermfg=NONE
          hi! SignColumn guibg=NONE
          hi! LineNr guifg=#868687
          " hi! Pmenu guibg=#NONE
          hi! PmenuSel guifg=#ffffff
          hi clear Todo
        augroup END
      ]],
		false
	)
end
