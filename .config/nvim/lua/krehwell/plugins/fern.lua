return {
	"lambdalisue/fern.vim",
	dependencies = {
		"lambdalisue/fern-git-status.vim",
		"lambdalisue/nerdfont.vim",
		"lambdalisue/fern-renderer-nerdfont.vim",
		"lambdalisue/fern-hijack.vim",
	},
	lazy = true,
	keys = {
		{
			"<Plug>(my-fern-toggle)",
			":Fern . -drawer -reveal=% -width=27 -wait<CR>",
			silent = true,
			desc = "fern toggler func",
		},
		{
			"<C-b>",
			"<Plug>(my-fern-toggle)<Plug>(fern-action-zoom:reset)",
			silent = true,
			desc = "Toggle drawer",
		},
	},
	init = function()
		vim.g["fern#hide_cursor"] = 0
		vim.g["fern#default_hidden"] = 1
		vim.g["fern#renderer"] = "nerdfont"
		-- vim.g["fern#renderer#nerdfont#root_symbol"] = " "
		vim.g["fern#renderer#nerdfont#indent_markers"] = 1
		vim.api.nvim_set_hl(0, "CursorLine", {})
		vim.api.nvim_set_hl(0, "CursorLine", { link = "Visual", default = true })

		vim.api.nvim_exec(
			[[
        function! s:init_fern() abort
          setlocal nonu norelativenumber
        endfunction

        augroup fern-custom
          autocmd! *
          autocmd BufWritePost * call feedkeys("\<Plug>(fern-action-redraw)")
          autocmd FileType fern nnoremap <buffer> <C-b> :q<cr>
          autocmd FileType fern call s:init_fern()

          " I don't want wilder on 'fern' due to the highlight is bad
          autocmd BufEnter,WinEnter * if &ft == "fern" | try | call wilder#disable() | catch | endtry | endif
          autocmd BufLeave,WinLeave * if &ft == "fern" | try | call wilder#enable() | catch | endtry | endif
        augroup END
      ]],
			false
		)
	end,
}
