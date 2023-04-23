vim.api.nvim_exec(
	[[
    augroup fern-custom
      autocmd! *
      autocmd BufWritePost * call feedkeys("\<Plug>(fern-action-redraw)")
      autocmd FileType fern setlocal nonu norelativenumber
      " Only close fern while on fern
      autocmd FileType fern nnoremap <buffer> <C-b> :q<cr>
    augroup END
  ]],
	false
)

vim.keymap.set("n", "<Plug>(my-fern-toggle)", ":Fern . -drawer -reveal=% -width=27 -wait<CR>", { silent = true })
vim.keymap.set("n", "<C-b>", "<Plug>(my-fern-toggle)<Plug>(fern-action-zoom:reset)")

-- fern default settings
vim.g["fern#hide_cursor"] = 0
vim.g["fern#default_hidden"] = 1
vim.g["fern#renderer"] = "nerdfont"
-- vim.g["fern#renderer#nerdfont#root_symbol"] = " "
vim.g["fern#renderer#nerdfont#indent_markers"] = 1
vim.api.nvim_set_hl(0, "CursorLine", {})
vim.api.nvim_set_hl(0, "CursorLine", { link = "Visual", default = true })
