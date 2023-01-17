-- testing
-- When editing a file, always jump to the last known cursor position.
-- Don't do it when the position is invalid, when inside an event handler
-- (happens when dropping a file on gvim) and for a commit message (it's
-- likely a different one than last time).
-- vim.api.nvim_create_autocmd("BufReadPost", {
-- https://github.com/creativenull/dotfiles/blob/9ae60de4f926436d5682406a5b801a3768bbc765/config/nvim/init.lua#L70-L86
-- 	group = vim.g.user.event,
-- 	callback = function(args)
-- 		local valid_line = vim.fn.line([['"]]) >= 1 and vim.fn.line([['"]]) < vim.fn.line("$")
-- 		local not_commit = vim.b[args.buf].filetype ~= "commit"
--
-- 		if valid_line and not_commit then
-- 			vim.cmd([[normal! g`"]])
-- 		end
-- 	end,
-- })

-- indentation behaviour
vim.api.nvim_exec(
	[[
    filetype plugin indent on
  ]],
	false
)
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
vim.opt.sidescrolloff = 15
-- vim.opt.virtualedit = "block"

-- search/find behavior
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = true
-- vim.opt.path:append("**")
vim.opt.isfname:append("@-@")
vim.opt.shortmess:append({ f = true }) -- aka `shortmess+=f`

-- etc
-- vim.opt.exrc = true
-- vim.opt.hidden = true
-- vim.opt.guicursor = ""
vim.opt.termguicolors = true
vim.opt.buflisted = false
vim.opt.compatible = false
vim.opt.showmode = true
vim.opt.wildmenu = true
-- vim.opt.ttimeoutlen = 0
vim.opt.updatetime = 150
vim.opt.spelllang = { "en_us" }
