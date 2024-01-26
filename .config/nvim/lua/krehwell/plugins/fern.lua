return {
	"lambdalisue/fern.vim",
	dependencies = {
		"lambdalisue/fern-git-status.vim",
		"lambdalisue/nerdfont.vim",
		"lambdalisue/fern-renderer-nerdfont.vim",
		-- "lambdalisue/fern-hijack.vim",
		"andykog/fern-highlight.vim",
		"lambdalisue/glyph-palette.vim",
		"andykog/fern-copynode.vim",
		"yuki-yano/fern-preview.vim",
		"LumaKernel/fern-mapping-reload-all.vim",
	},
	lazy = true,
	ft = { "fern", "" },
	keys = {
		{
			"<Plug>(my-fern-toggle)",
			":Fern . -drawer -reveal=% -width=27 -wait<CR>",
			silent = true,
			desc = "fern toggler func",
		},
		{
			"<C-b>",
			desc = "Toggle drawer",
			silent = true,
		},
	},
	config = function()
		vim.g["fern#hide_cursor"] = 0
		vim.g["fern#default_hidden"] = 1
		vim.g["fern#renderer"] = "nerdfont"
		vim.g["fern#renderer#nerdfont#indent_markers"] = 0
		vim.g["fern#renderer#nerdfont#leading"] = "╎ "
		vim.g["fern#renderer#nerdfont#padding"] = " "
		-- vim.g["fern#renderer#nerdfont#root_symbol"] = " "

		-- FERN TOGGLER
		-- <C-b> behavior
		-- if no buffer/window name fern then open fern
		-- if fern buffer exists but not focus, then move cursor to fern window
		-- if fern buffer exists and focus, then close fern
		vim.cmd([[
        nnoremap <silent> <C-B> :call ToggleFernBuffer()<CR>

        function! ToggleFernBuffer()
            let current_filetype = &filetype
            if current_filetype ==# 'fern'
                execute "q"
            else
                execute ":Fern . -reveal=% -drawer"
            endif
        endfunction
      ]])

		-- FERN PREVIEWER
		vim.cmd([[
      function! s:fern_previewer() abort
        nmap <silent> <buffer> p     <Plug>(fern-action-preview:toggle)
        " nmap <silent> <buffer> <C-p> <Plug>(fern-action-preview:auto:toggle)
        nmap <silent> <buffer> <C-j> <Plug>(fern-action-preview:scroll:down:half)
        nmap <silent> <buffer> <C-k> <Plug>(fern-action-preview:scroll:up:half)
      endfunction

      augroup fern-previewer-settings
        autocmd!
        autocmd FileType fern call s:fern_previewer()
      augroup END
    ]])

		-- FERN CUSTOM SETS
		vim.cmd([[
        function! s:init_fern() abort
          setlocal nonu norelativenumber
        endfunction

        augroup fern-custom
          autocmd! *
          autocmd BufWritePost * call feedkeys("\<Plug>(fern-action-redraw)")
          autocmd FileType fern call s:init_fern()
          autocmd FileType fern call glyph_palette#apply()
        augroup end
      ]])
	end,
}
