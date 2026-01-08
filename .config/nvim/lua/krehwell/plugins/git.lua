vim.opt.diffopt = vim.opt.diffopt + "vertical"

return {
	"lewis6991/gitsigns.nvim",
	event = "BufReadPre",
	dependencies = {
		{ "tpope/vim-fugitive" },
		{ "tpope/vim-rhubarb" },
		{
			"mbbill/undotree",
			keys = { { "<leader>u", ":UndotreeToggle<CR>:UndotreeFocus<CR>", desc = "Toggle undotree", mode = "n" } },
			init = function()
				vim.g.undotree_SetFocusWhenToggle = 1
			end,
		},
	},

	keys = {
		{
			"gs",
			function()
				-- close git status if "gs" in it
				vim.cmd([[
                    augroup FugitiveToggleMapping
                        autocmd!
                        autocmd Filetype fugitive nnoremap <buffer> gs :q<cr>
                    augroup END
                ]])
				vim.cmd("Git")
			end,
			desc = "Git: toggle status",
		},
		{ "dh", ":diffget //2 <CR>", desc = "Git: get lhs of diff" },
		{ "dl", ":diffget //3 <CR>", desc = "Git: get rhs of diff" },
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
					vim.cmd.normal({ "]c", bang = true })
				else
					require("gitsigns").nav_hunk("next")
				end
			end,
			desc = "Git: jump to next line change",
		},
		{
			"[g",
			function()
				if vim.wo.diff then
					vim.cmd.normal({ "[c", bang = true })
				else
					require("gitsigns").nav_hunk("prev")
				end
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
		-- 	changedelete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn", },
		-- 	untracked = { hl = "GitSignsAdd", text = "┆", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
		-- },
		signcolumn = false,
		numhl = true,
		attach_to_untracked = true,

		watch_gitdir = { interval = 1000, follow_files = true },

		current_line_blame = true,
		current_line_blame_opts = { virt_text = true, virt_text_pos = "eol", virt_text_priority = 9999 },
	},
}
