-- vim.api.nvim_exec(
-- 	[[
--     filetype plugin indent on
--   ]],
-- 	false
-- )

-- indentation behaviour
vim.opt.backspace = "2"
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- hidden file related config
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true

-- window behavior
vim.opt.colorcolumn = "120"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.eadirection = "ver"
vim.opt.equalalways = false
vim.opt.signcolumn = "yes:1"
vim.opt.title = true

-- navigation behavior
vim.opt.wrap = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 5

-- search behavior
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = true

-- etc
vim.opt.exrc = true
vim.opt.hidden = true
vim.opt.termguicolors = true
vim.opt.buflisted = false
vim.opt.compatible = false
vim.opt.showmode = true
vim.opt.wildmenu = true
vim.opt.ttimeoutlen = 0
vim.opt.updatetime = 10
vim.opt.shortmess:append({ f = true }) -- aka `shortmess+=f`
vim.opt.path:append("**")
vim.opt.isfname:append("@-@")

-- folding
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99 -- Don't fold anything by default - I'll close the folds myself
vim.opt.foldminlines = 5 -- Don't bother folding small blocks
-- vim.o.foldclose = 'all' -- Autoclose folds when moving out of them
vim.opt.foldcolumn = "0" -- Fold column
