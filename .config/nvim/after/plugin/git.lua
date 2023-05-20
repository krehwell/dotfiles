local present, gitsigns = pcall(require, "gitsigns")
if not present then
	return
end

-- GIT SIGN SETUP
gitsigns.setup({
	signs = {
		add = { hl = "GitSignsAdd", text = "+", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
		change = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
		delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		changedelete = { hl = "GitSignsDelete", text = "~_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		untracked = { hl = "GitSignsAdd", text = "┆", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
	},
	signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
	numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
	linehl = false, -- Toggle with `:Gitsigns toggle_linehl`

	word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
	watch_gitdir = {
		interval = 1500,
		follow_files = true,
	},
	attach_to_untracked = true,

	current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
		delay = 650,
		ignore_whitespace = false,
	},
	current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",

	sign_priority = 6,
	update_debounce = 300,
	status_formatter = nil, -- Use default
	max_file_length = 40000, -- Disable if file is longer than this (in lines)
	preview_config = {
		-- Options passed to nvim_open_win
		border = "single",
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},

	yadm = {
		enable = false,
	},

	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		map("n", "g]", function() -- default to ]h
			if vim.wo.diff then
				return "]c"
			end
			vim.schedule(function()
				gs.next_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })
		map("n", "g[", function() -- default to [h
			if vim.wo.diff then
				return "[c"
			end
			vim.schedule(function()
				gs.prev_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })
		map("n", "gu", gs.reset_hunk)
		map("n", "gp", gs.preview_hunk)
	end,
})

-- FUGITIVE SETUP
vim.g.gitgutter_map_keys = 0 -- prevent default key binding
vim.opt.diffopt = vim.opt.diffopt + "vertical"

vim.keymap.set("n", "gu", ":GitGutterUndoHunk<CR>")
vim.keymap.set("n", "g]", ":call GitGutterNextHunkCycle()<CR>")
vim.keymap.set("n", "g[", ":call GitGutterPrevHunkCycle()<CR>")
vim.keymap.set("n", "gp", ":GitGutterPreviewHunk<CR>")

vim.keymap.set("n", "gs", ":Git<CR>")
vim.keymap.set("n", "gh", ":diffget //2 <CR>")
vim.keymap.set("n", "gl", ":diffget //3 <CR>")

vim.keymap.set("c", "GIT", "Git")
vim.keymap.set("c", "GIt", "Git")
vim.keymap.set("c", "Gti", "Git")
vim.keymap.set("c", "GTi", "Git")
vim.keymap.set("c", "git", "Git")

vim.api.nvim_exec(
	[[
    " ----- GIT STATUS TOGGLE
    augroup FugitiveToggleMapping
        autocmd Filetype fugitive nnoremap <buffer> gs :q<cr>
    augroup END
  ]],
	false
)
