local present, barbecue = pcall(require, "barbecue")
if not present then
	return
end

vim.opt.laststatus = 0

vim.keymap.set("n", "[[", ":lua require('barbecue.ui').navigate(-1)<CR>")
vim.keymap.set("n", "]]", ":lua require('barbecue.ui').navigate(1)<CR>")

-- triggers CursorHold event faster
vim.opt.updatetime = 200

barbecue.setup({
	create_autocmd = false, -- prevent barbecue from updating itself automatically
})

vim.api.nvim_create_autocmd({
	"WinScrolled", -- or WinResized on NVIM-v0.9 and higher
	"BufWinEnter",
	"CursorHold",
	"InsertLeave",

	-- include these if you have set `show_modified` to `true`
	"BufWritePost",
	"TextChanged",
	"TextChangedI",
}, {
	group = vim.api.nvim_create_augroup("barbecue.updater", {}),
	callback = function()
		require("barbecue.ui").update()
	end,
})
