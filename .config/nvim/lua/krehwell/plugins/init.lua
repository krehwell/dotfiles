return {
	-- LSP
	"jose-elias-alvarez/null-ls.nvim", -- formatter, etc
	{ "folke/neodev.nvim", ft = { "lua", "vim" } }, -- improve lua with vim :')
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			{ "neovim/nvim-lspconfig" },
			{
				"williamboman/mason.nvim",
				build = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
				cmd = "Mason",
			},
			{ "williamboman/mason-lspconfig.nvim" },
		},
	},

	-- CODE EDITING/NAVIGATIONS
	{
		-- css to jsx inline
		"isomoar/vim-css-to-inline",
		keys = {
			{ "tis", desc = "Transform to inline styles" },
			{ "fis", desc = "Transform from inline styles to css" },
		},
	},
	-- for splitting/joining blocks of code like arrays, hashes, statements, objects, dictionaries, etc.
	{
		"Wansmer/treesj",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("treesj").setup({
				use_default_keymaps = false, -- (<space>m - toggle, <space>j - join, <space>s - split)
				check_syntax_error = true, -- node with syntax error will not be formatted
				max_join_length = 120, -- don't format for line more than
				-- hold|start|end:
				-- hold - cursor follows the node/place on which it was called
				-- start - cursor jumps to the first symbol of the node being formatted
				-- end - cursor jumps to the last symbol of the node being formatted
				cursor_behavior = "hold",
				-- Notify about possible problems or not
				notify = true,
				dot_repeat = true,
			})
		end,
		-- keys = { "<space>m", "<space>j", "<space>s" },
		cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
	},
	{
		"tpope/vim-surround",
		keys = {
			{ "cs", "<Plug>VSurround", desc = "Change surround", mode = "n" },
			{ "ds", "<Plug>Dsurround", desc = "Delete surround", mode = "n" },
			{ "ys", "<Plug>Ysurround", desc = "Yank surround", mode = "n" },
			{ "S", mode = "v" },
		},
	},
	{
		"tpope/vim-repeat",
		keys = { { "." } },
	},
	{
		"ojroques/vim-oscyank",
		branch = "main",
		keys = {
			{ "<C-c>", ":OSCYankVisual<CR>", desc = "Copy to clipboard", mode = "v" },
		},
		init = function()
			vim.g.oscyank_term = "default"
		end,
	},
	{
		"mbbill/undotree",
		keys = {
			{ "<leader>u", ":UndotreeToggle<CR>:UndotreeFocus<CR>", desc = "Toggle undotree", mode = "n" },
		},
	},
	{
		"mg979/vim-visual-multi",
		keys = {
			{ "<C-n>", "<Plug>(VM-Select-Next)", desc = "Select next match", mode = { "n", "v" } },
		},
	},
	{
		"tomasky/bookmarks.nvim",
		opts = {
			sign_priority = 100,
			save_file = vim.fn.expand("$HOME/.vim/.bookmarks"), -- bookmarks save file path
			keywords = {
				["@t"] = "☑️",
				["@w"] = "⚠️",
				["@f"] = "🛠️",
				["@n"] = "🗒️",
			},
		},
		keys = {
			{ "mm", "<cmd>lua require('bookmarks').bookmark_toggle()<cr>", desc = "Toggle bookmarks" },
			{ "mc", "<cmd>lua require('bookmarks').bookmark_clean()<cr>", desc = "Clean bookmarks" },
			{
				"mi",
				"<cmd>lua require('bookmarks').bookmark_ann()<cr>",
				desc = "Add or edit mark annotation at current line",
			},
			{ "m]", "<cmd>lua require('bookmarks').bookmark_next()<cr>", desc = "Jump to next bookmark" },
			{ "m[", "<cmd>lua require('bookmarks').bookmark_prev()<cr>", desc = "Jump to previous bookmark" },
			{ "ml", "<cmd>lua require('bookmarks').bookmark_list()<cr>", desc = "Show bookmarks" },
		},
	},

	-- BEAUTIFY
	{
		"folke/todo-comments.nvim",
		event = { "CursorMoved" },
		opts = {
			signs = false,
			highlight = {
				multiline = false, -- enable multine todo comments
			},
		},
	},
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		opts = {
			window = { relative = "win", blend = 0, zindex = nil, border = "none" },
		},
	},
	{
		"brenoprata10/nvim-highlight-colors",
		event = { "VeryLazy", "CursorMoved" },
		opts = {
			render = "background", -- or 'foreground' or 'first_column'
			enable_named_colors = true,
			enable_tailwind = true,
		},
	},
	{
		"nvim-tree/nvim-web-devicons",
		event = "VeryLazy",
		lazy = true,
		opts = {
			override = {
				zsh = { icon = "", color = "#428850", cterm_color = "65", name = "Zsh" },
			},
			color_icons = true,
			default = true,
		},
	},
	{ "pbrisbin/vim-colors-off", priority = 1000, lazy = true, event = "VeryLazy" },
	{ "nyoom-engineering/oxocarbon.nvim" },
	{ "morhetz/gruvbox", priority = 1000, lazy = true, event = "VeryLazy" },
	{ "archseer/colibri.vim", priority = 1000, lazy = true, event = "VeryLazy" },
	{ "fxn/vim-monochrome", priority = 1000, lazy = true, event = "VeryLazy" },
	{ "jaredgorski/Mies.vim", priority = 1000, lazy = true, event = "VeryLazy" },
	{ "jaredgorski/fogbell.vim", priority = 1000, lazy = true, event = "VeryLazy" },
}
