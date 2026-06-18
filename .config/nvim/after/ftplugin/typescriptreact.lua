local function console_format()
    vim.cmd("normal! viwy")
    vim.cmd("normal! o")
    vim.cmd("normal! a console.log()")
    vim.cmd("normal! P")
    vim.cmd("normal! ==")
end

vim.keymap.set("n", "<leader><leader>", console_format, { noremap = true, silent = true, buffer = true })
vim.keymap.set("n", "[[", "?\\(const\\|function\\) [A-Z].*(<CR>w:noh<CR>", { buffer = true, silent = true })
