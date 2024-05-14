vim.opt.diffopt = vim.opt.diffopt + "vertical"

return {
	"lewis6991/gitsigns.nvim",
	event = "CursorMoved",
	dependencies = {
		{
			"tpope/vim-fugitive",
			config = function()
				vim.cmd([[
                    augroup FugitiveToggleMapping
                        autocmd Filetype fugitive nnoremap <buffer> gs :q<cr>
                    augroup END
                ]])
			end,
		},
		{ "tpope/vim-rhubarb" },
	},

	keys = {
		{ "gs", ":Git<CR>", desc = "Git: toggle status", silent = true },
		{ "gh", ":diffget //2 <CR>", desc = "Git: get lhs of diff", silent = true },
		{ "gl", ":diffget //3 <CR>", desc = "Git: get rhs of diff", silent = true },
		{ "gu", ":GitGutterUndoHunk<CR>", desc = "Git: undo hunk", silent = true },
		{ "gp", ":lua require('gitsigns').preview_hunk()<CR>", desc = "Git: preview hunk", silent = true },
		{ "gu", ":lua require('gitsigns').reset_hunk()<CR>", desc = "Git: reset current lines change" },
		{
			"]g",
			function() -- default to ]h
				if vim.wo.diff then
					return "]c"
				end
				vim.schedule(function()
					require("gitsigns").next_hunk()
				end)
				return "<Ignore>"
			end,
			desc = "Git: jump to next lines change",
		},
		{
			"[g",
			function() -- default to ]h
				if vim.wo.diff then
					return "]c"
				end
				vim.schedule(function()
					require("gitsigns").prev_hunk()
				end)
				return "<Ignore>"
			end,
			desc = "Git: jump to prev lines change",
		},
	},

	opts = {
		-- signs = {
		-- 	add = { hl = "GitSignsAdd", text = "+", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
		-- 	change = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
		-- 	delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		-- 	topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		-- 	changedelete = {
		-- 		hl = "GitSignsDelete",
		-- 		text = "_",
		-- 		numhl = "GitSignsDeleteNr",
		-- 		linehl = "GitSignsDeleteLn",
		-- 	},
		-- 	untracked = { hl = "GitSignsAdd", text = "┆", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
		-- },
		attach_to_untracked = true,

		current_line_blame = true,
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
			delay = 650,
			ignore_whitespace = false,
		},
		current_line_blame_formatter = "     <author>, <author_time:%d-%m-%Y> - <summary>",

		sign_priority = 6,
		update_debounce = 300,
		max_file_length = 2000, -- Disable if file is longer than this (in lines)
		preview_config = { border = "single", style = "minimal", relative = "cursor", row = 0, col = 1 },
	},
}
