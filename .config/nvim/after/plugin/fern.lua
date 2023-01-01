-- vim.g["fern#renderer"] = "nerdfont" -- uncomment this to give icon on fern

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
vim.keymap.set("n", "<C-b>", "<Plug>(my-fern-toggle)<Plug>(fern-action-zoom:reset)<Plug>(fern-action-hidden:set)")
