vim.cmd.runtime("after/ftplugin/typescript.lua")
vim.keymap.set("n", "[[", "?\\(const\\|function\\) [A-Z].*(<CR>w:noh<CR>", { buffer = true, silent = true })
