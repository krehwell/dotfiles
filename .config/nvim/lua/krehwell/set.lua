-- indentation behaviour
vim.cmd([[
  filetype plugin indent on
]])

vim.loader.enable()
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

-- WINDOW BEHAVIOR
vim.opt.colorcolumn = "120"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.eadirection = "both"
vim.opt.equalalways = true
vim.opt.title = true

-- NAVIGATION BEHAVIOR
vim.opt.wrap = false
-- vim.opt.number = true
-- vim.opt.relativenumber = true
vim.opt.signcolumn = "no"
vim.opt.scrolloff = 22
vim.opt.sidescrolloff = 18
vim.opt.virtualedit = "block"
vim.opt.laststatus = 0
-- vim.opt.jumpoptions:append("view")
-- vim.opt.virtualedit = "block"

-- SEARCH/FIND BEHAVIOR
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = true
-- vim.opt.path:append("**")
vim.opt.isfname:append("@-@")
vim.opt.shortmess:append({ f = true }) -- aka `shortmess+=f`

-- ETC
-- vim.opt.hidden = true
-- vim.opt.guicursor = ""
vim.opt.termguicolors = true
vim.opt.buflisted = false
vim.opt.compatible = false
vim.opt.showmode = true
vim.opt.wildmenu = true
-- vim.opt.ttimeoutlen = 0
vim.opt.updatetime = 350
vim.opt.exrc = true
vim.opt.secure = true
