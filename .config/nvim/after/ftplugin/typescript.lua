vim.cmd([[
	au BufNewFile,BufRead,FocusGained,WinEnter,BufEnter *.tsx setf typescript
]])

local function console_format()
	vim.cmd("normal! viwy")
	vim.cmd("normal! o")
	vim.cmd("normal! a console.log()")
	vim.cmd("normal! P")
	vim.cmd("normal! ==")
end

vim.keymap.set("n", "<leader><leader>", console_format, { noremap = true, silent = true })
