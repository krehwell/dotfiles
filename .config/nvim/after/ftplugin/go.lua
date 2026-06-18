local function printf_format()
    vim.cmd("normal! viwy")
    vim.cmd("normal! o")
    vim.cmd('normal! a fmt.Printf("%v", )')
    vim.cmd("normal! F)")
    vim.cmd("normal! P")
    vim.cmd("normal! ==")
end

vim.keymap.set("n", "<leader>l", printf_format, { noremap = true, silent = true })
