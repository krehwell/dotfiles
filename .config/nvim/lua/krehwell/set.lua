vim.g.user = {
	event = "UserGroup",
}
vim.api.nvim_create_augroup(vim.g.user.event, {})
vim.api.nvim_create_autocmd("BufReadPost", {
	-- https://github.com/creativenull/dotfiles/blob/eb9b0a69c411b7ed88eca74d740b710e7591473a/config/nvim/init.lua#L70-L81
	group = vim.g.user.event,
	callback = function(args)
		local valid_line = vim.fn.line([['"]]) >= 1 and vim.fn.line([['"]]) < vim.fn.line("$")
		local not_commit = vim.b[args.buf].filetype ~= "commit"

		if valid_line and not_commit then
			vim.cmd([[normal! g`"]])
		end
	end,
})

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
vim.opt.textwidth = 120

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
vim.opt.virtualedit = "block"
vim.opt.jumpoptions:append("view")
-- vim.opt.virtualedit = "block"

-- search/find behavior
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = true
-- vim.opt.path:append("**")
vim.opt.isfname:append("@-@")
vim.opt.shortmess:append({ f = true }) -- aka `shortmess+=f`

-- etc
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
