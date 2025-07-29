-- indentation behaviour
vim.cmd([[
  " filetype plugin indent on
]])

vim.loader.enable()
-- Use an indentation of 4 spaces.
vim.opt.backspace = "2"
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.textwidth = 120
vim.opt.cursorline = true

-- HIDDEN FILE RELATED CONFIG
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.autoread = true

-- WINDOW BEHAVIOR
vim.opt.colorcolumn = "120"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.eadirection = "both"
vim.opt.equalalways = true
vim.opt.title = true
vim.opt.winborder = "rounded"
vim.opt.wildmenu = true

-- Completion.
vim.opt.wildignore:append({ ".DS_Store" })
vim.o.completeopt = "menuone,noselect,noinsert"
vim.o.pumheight = 15

-- SHOW WHITESPACE
-- vim.opt.list = true
vim.opt.listchars = { space = "⋅", trail = "⋅", tab = "  ↦" }

-- NAVIGATION BEHAVIOR
vim.opt.wrap = false
-- vim.opt.number = true
-- vim.opt.relativenumber = true
vim.opt.signcolumn = "no"
vim.opt.scrolloff = 22
vim.opt.sidescrolloff = 18
vim.opt.virtualedit = "block"
vim.opt.laststatus = 0
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
-- vim.opt.jumpoptions:append("stack")
vim.opt.jumpoptions:append("clean")
vim.optfoldmethod = "indent"
-- vim.opt.virtualedit = "block"

-- SEARCH/FIND BEHAVIOR
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = true
-- vim.opt.path:append("**")
vim.opt.isfname:append("@-@")
vim.opt.shortmess:append({
	w = true,
	s = true,
})

-- DISABLE HEALTH CHECKS FOR THESE PROVIDERS.
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

-- ETC
-- vim.opt.hidden = true
vim.o.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,t:block-TermCursor"
vim.opt.termguicolors = true
vim.opt.buflisted = false
vim.opt.compatible = false
vim.opt.showmode = true
-- vim.opt.ttimeoutlen = 0
vim.opt.updatetime = 200
vim.opt.exrc = true
vim.opt.secure = true
