local function console_format()
	vim.cmd("normal! viwy")
	vim.cmd("normal! o")
	vim.cmd('normal! a console.log()')
	vim.cmd("normal! P")
	vim.cmd("normal! ==")
end

vim.keymap.set("n", "<leader>l", console_format, { noremap = true, silent = true })
