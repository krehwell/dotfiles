vim.opt.background = "dark"
vim.opt.termguicolors = true
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
-- check if colorscheme exists
local present, _ = pcall(vim.api.nvim_command, "colorscheme " .. colorscheme)
if not present then
	return print("colorscheme " .. colorscheme .. " not found!")
end

function ColorMyPencils(color)
	color = color or colorscheme
	vim.cmd.colorscheme(color)

	vim.api.nvim_exec(
		[[
      hi VertSplit guibg=NONE guifg=NONE ctermbg=NONE ctermfg=NONE
      hi Normal guibg=NONE ctermbg=NONE
    ]],
		false
	)
end

-- OFF COLORSCHEME CONFIGURATION
if colorscheme == "off" then
	ColorMyPencils()
end

-- GRUVBOX COLORSCHEME CONFIGURATION
if colorscheme == "gruvbox" then
	-- other custom config, heighlight line number maybe?
	ColorMyPencils()
end