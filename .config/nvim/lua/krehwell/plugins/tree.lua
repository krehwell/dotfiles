local minifiles = {
	"echasnovski/mini.files",
	version = "*",
	keys = {
		{
			"<C-b>",
			function()
				local minifiles = require("mini.files")
				local current_filetype = vim.bo.filetype
				if current_filetype == "minifiles" then
					minifiles.close()
				else
					minifiles.open(vim.api.nvim_buf_get_name(0), true)
				end
			end,
			desc = "Open file explorer (mini.files)",
      silent = true,
		},
	},
	opts = {
		-- Customization of shown content
		content = {
			filter = nil,
			prefix = nil,
			sort = nil,
		},

		-- Module mappings created only inside explorer.
		-- Use `''` (empty string) to not create one.
		mappings = {
			close = "<c-[>",
			go_in = "l",
			go_in_plus = "<CR>",
			go_out = "<BS>",
			go_out_plus = "H",
			reset = "R",
			reveal_cwd = "@",
			show_help = "g?",
			synchronize = "=",
			trim_left = "<",
			trim_right = ">",
		},

		-- General options
		options = {
			-- Whether to delete permanently or move into module-specific trash
			permanent_delete = false,
			-- Whether to use for editing directories
			use_as_default_explorer = true,
		},

		-- Customization of explorer windows
		windows = {
			max_number = math.huge, -- Maximum number of windows to show side by side
			preview = false, -- Whether to show preview of file/directory under cursor
			width_focus = 50,
			width_nofocus = 15,
			width_preview = 25,
		},
	},
}

-- I'm not using fern for now
local fern = {
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
	enabled = false,
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
			desc = "Open file explorer (fern)",
			silent = true,
		},
	},
	config = function()
		vim.g["fern#hide_cursor"] = 0
		vim.g["fern#default_hidden"] = 1
		vim.g["fern#renderer"] = "nerdfont"
		vim.g["fern#renderer#nerdfont#indent_markers"] = 0
		vim.g["fern#renderer#nerdfont#leading"] = "  " -- ╎
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
          setlocal signcolumn=no
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

return minifiles;

