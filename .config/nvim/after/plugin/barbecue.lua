local present, barbecue = pcall(require, "barbecue")
if not present then
	return
end

vim.opt.laststatus = 0
vim.keymap.set("n", "[[", ":lua require('barbecue.ui').navigate(-1)<CR>", { silent = true })

barbecue.setup({
	create_autocmd = false, -- prevent barbecue from updating itself automatically
	show_dirname = true,
	show_modified = true,
	modifiers = {
		dirname = ":h:t",
		basename = "",
	},
	theme = {
		normal = { bg = "#303030", fg = "#c6c6c6" },
	},
	symbols = {
		modified = "+",
		ellipsis = "…",
		separator = ">",
	},
})

vim.api.nvim_create_autocmd({
	"WinScrolled",
	"BufWinEnter",
	"CursorHold",
	"InsertLeave",

	"BufWritePost",
	"TextChanged",
	"TextChangedI",
}, {
	group = vim.api.nvim_create_augroup("barbecue.updater", {}),
	callback = function()
		require("barbecue.ui").update()
	end,
})
