-- Set <space> as the leader key.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Use an indentation of 4 spaces.
vim.o.sw = 4
vim.o.ts = 4
vim.o.et = true

vim.opt.number = false
vim.opt.relativenumber = false
vim.opt.wrap = false

-- Show whitespace.
-- vim.opt.list = true
vim.opt.listchars = { space = "⋅", trail = "⋅", tab = "  ↦" }

-- Enable mouse mode.
vim.o.mouse = "a"

-- Disable horizontal scrolling.
vim.o.mousescroll = "ver:3,hor:0"

-- Folding.
vim.o.foldcolumn = "1"
vim.o.foldlevelstart = 99
vim.wo.foldtext = ""

-- UI characters.
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

-- Use rounded borders for floating windows.
-- WINDOW BEHAVIOR
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.eadirection = "both"
-- vim.opt.equalalways = true
vim.opt.title = true
vim.o.winborder = "rounded"

-- Sync clipboard between the OS and Neovim.
-- vim.o.clipboard = "unnamedplus"

-- Save undo history.
vim.o.undofile = true
vim.opt.backup = false

-- Case insensitive searching UNLESS /C or the search has capitals.
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default.
-- vim.wo.signcolumn = "yes"

-- Update times and timeouts.
vim.o.updatetime = 300
vim.o.timeoutlen = 500
vim.o.ttimeoutlen = 10

-- Completion.
vim.opt.wildignore:append({ ".DS_Store" })
vim.o.completeopt = "menuone,noselect,noinsert"
vim.o.pumheight = 15

-- Diff mode settings.
-- Setting the context to a very large number disables folding.
-- vim.opt.diffopt:append("vertical,context:99")

vim.opt.shortmess:append({
	w = true,
	s = true,
})

-- Status line.
vim.o.laststatus = 0
vim.o.cmdheight = 1

-- Disable cursor blinking in terminal mode.
vim.o.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,t:block-TermCursor"

-- Disable health checks for these providers.
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0
