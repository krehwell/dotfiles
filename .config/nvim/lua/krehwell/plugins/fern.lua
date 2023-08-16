return {
	"lambdalisue/fern.vim",
	dependencies = {
		"lambdalisue/fern-git-status.vim",
		"lambdalisue/nerdfont.vim",
		"lambdalisue/fern-renderer-nerdfont.vim",
		"lambdalisue/fern-hijack.vim",
		"andykog/fern-highlight.vim",
		"lambdalisue/glyph-palette.vim",
		"andykog/fern-copynode.vim",
	},
	lazy = true,
	ft = { "fern" },
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
		vim.g["fern#renderer#nerdfont#indent_markers"] = 1
		-- vim.g["fern#renderer#nerdfont#root_symbol"] = " "

		-- <C-b> behavior
		-- if no buffer/window name fern then open fern
		-- if fern buffer exists but not focus, then move cursor to fern window
		-- if fern buffer exists and focus, then close fern
		vim.api.nvim_exec(
			[[
        nnoremap <silent> <C-B> :call ToggleFernBuffer()<CR>

        function! ToggleFernBuffer()
            let fern_buffer_exists = 0
            let current_tab = tabpagenr()

            for win_id in tabpagebuflist(current_tab)
                let buffer_name = bufname(win_id)
                let buffer_filetype = getbufvar(win_id, '&filetype')

                if buffer_filetype ==# 'fern'
                    let fern_buffer_exists = 1
                    break
                endif
            endfor

            if fern_buffer_exists
                let current_filetype = &filetype
                if current_filetype ==# 'fern'
                    execute "q"
                else
                    call GoToBufferWindow('fern')
                endif
            else
                call feedkeys("\<Plug>(my-fern-toggle)\<Plug>(fern-action-zoom:reset)", 'n')
            endif
        endfunction

        function! GoToBufferWindow(buffer_name)
            let target_buffer_name = a:buffer_name
            let target_win = -1

            for win_nr in range(1, winnr('$'))
                if bufname(winbufnr(win_nr)) =~# target_buffer_name
                    let target_win = win_nr
                    break
                endif
            endfor

            if target_win != -1
                exe target_win . 'wincmd w'
            else
                echo "Buffer '" . target_buffer_name . "' not found in any window."
            endif
        endfunction
      ]],
			false
		)

		vim.api.nvim_exec(
			[[
        function! s:init_fern() abort
          setlocal nonu norelativenumber
        endfunction

        augroup fern-custom
          autocmd! *
          autocmd BufWritePost * call feedkeys("\<Plug>(fern-action-redraw)")
          autocmd FileType fern call s:init_fern()
          autocmd FileType fern call glyph_palette#apply()
        augroup end
      ]],
			false
		)
	end,
}
