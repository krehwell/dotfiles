vim.opt.diffopt = vim.opt.diffopt + "vertical"

return {
	"lewis6991/gitsigns.nvim",
	event = "BufReadPre",
	dependencies = {
		{
			"tpope/vim-fugitive",
			config = function()
				vim.cmd([[
                    augroup FugitiveToggleMapping
                        autocmd!
                        autocmd Filetype fugitive nnoremap <buffer> gs :q<cr>
                    augroup END
                ]])
			end,
		},
		{ "tpope/vim-rhubarb" },
	},

	keys = {
		{ "gs", function ()
            if vim.bo.filetype == "snacks_dashboard" then
                vim.cmd("Git")
                vim.cmd("wincmd w")
                vim.cmd("q")
            end
		end , desc = "Git: toggle status", silent = true },
		{ "gh", ":diffget //2 <CR>", desc = "Git: get lhs of diff", silent = true },
		{ "gl", ":diffget //3 <CR>", desc = "Git: get rhs of diff", silent = true },
		{
			"gp",
			function()
				vim.cmd("Gitsigns preview_hunk")
			end,
			desc = "Git: preview hunk",
			silent = true,
		},
		{
			"gu",
			function()
				vim.cmd("Gitsigns reset_hunk")
			end,
			desc = "Git: reset current lines change",
		},
		{
			"]g",
			function()
				if vim.wo.diff then
					return "]c"
				end
				vim.schedule(function()
					require("gitsigns").nav_hunk("next")
				end)
				return "<Ignore>"
			end,
			desc = "Git: jump to next line change",
		},
		{
			"[g",
			function()
				if vim.wo.diff then
					return "]c"
				end
				vim.schedule(function()
					require("gitsigns").nav_hunk("prev")
				end)
				return "<Ignore>"
			end,
			desc = "Git: jump to prev line change",
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
		signcolumn = false,
		numhl = true,
		linehl = false,
		attach_to_untracked = true,

		watch_gitdir = {
			interval = 1000,
			follow_files = true,
		},

		current_line_blame = true,
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
			delay = 650,
			ignore_whitespace = false,
		},
		current_line_blame_formatter = "     <author>, <author_time:%d-%m-%Y> - <summary>",

		status_formatter = nil,
		sign_priority = 6,
		update_debounce = 100,
		max_file_length = 2000, -- Disable if file is longer than this (in lines)
		preview_config = { border = "single", style = "minimal", relative = "cursor", row = 0, col = 1 },
	},
}
