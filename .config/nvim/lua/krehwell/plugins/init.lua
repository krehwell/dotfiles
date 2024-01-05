return {
	-- LSP
	{ "folke/neodev.nvim", ft = { "lua", "vim" } }, -- improve lua with vim :')
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		dependencies = {
			{ "neovim/nvim-lspconfig" },
			{
				"williamboman/mason.nvim",
				cmd = "Mason",
				opts = {
					ui = {
						border = "rounded",
					},
				},
			},
			{ "williamboman/mason-lspconfig.nvim" },
		},
	},
	{ "jose-elias-alvarez/null-ls.nvim" }, -- formatter, etc
	-- {
	-- 	"zeioth/garbage-day.nvim",
	-- 	dependencies = "neovim/nvim-lspconfig",
	-- 	event = "VeryLazy",
	-- },

	-- HELPERS/NAVIGATIONS
	{
		-- css to jsx inline
		"isomoar/vim-css-to-inline",
		keys = {
			{ "tis", desc = "Transform to inline styles" },
			{ "fis", desc = "Transform from inline styles to css" },
		},
	},
	{
		"tpope/vim-surround",
		keys = {
			{ "cs", "<Plug>VSurround", desc = "Change surround", mode = "n" },
			{ "ds", "<Plug>Dsurround", desc = "Delete surround", mode = "n" },
			{ "ys", "<Plug>Ysurround", desc = "Yank surround", mode = "n" },
			{ "S", mode = "v", desc = "Surround selected" },
		},
	},
	{ "tpope/vim-repeat", keys = { { "." } } },
	{
		"ojroques/vim-oscyank",
		branch = "main",
		keys = { { "<C-c>", ":OSCYankVisual<CR>", desc = "Copy to clipboard", mode = "v" } },
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
		"kevinhwang91/nvim-fundo",
		event = "VeryLazy",
		dependencies = {
			{
				"kevinhwang91/promise-async",
				build = function()
					require("fundo").install()
				end,
			},
		},
		config = function()
			vim.o.undofile = true
			require("fundo").setup()
		end,
	},
	{
		"mg979/vim-visual-multi",
		keys = {
			{ "<C-n>", "<Plug>(VM-Select-Next)", desc = "Select next match", mode = { "n", "v" } },
		},
	},
	{
		"chrisgrieser/nvim-early-retirement",
		config = true,
		event = "VeryLazy",
		opts = { retirementAgeMins = 15 },
	},

	-- BEAUTIFY
	{
		"mhinz/vim-startify",
		config = function()
			vim.g.startify_session_dir = "$HOME/.vim/session"
		end,
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = "TroubleToggle",
		keys = {
			{ "<leader>tr", "<cmd>TroubleToggle<cr>", desc = "Trouble toggle" },
		},
	},
	{
		"folke/todo-comments.nvim",
		event = { "CursorMoved" },
		opts = {
			signs = false,
			highlight = { multiline = false },
		},
	},
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		event = "LspAttach",
		opts = {
			window = { relative = "win", blend = 0, zindex = nil, border = "none" },
		},
	},
	{
		"uga-rosa/ccc.nvim",
		event = { "VeryLazy", "CursorMoved" },
		config = function()
			require("ccc").setup({
				highlighter = {
					auto_enable = true,
					lsp = true,
				},
			})
		end,
		keys = { { "<leader>ccc", ":Ccc" } },
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

	-- THEME
	{ "pbrisbin/vim-colors-off", priority = 1000, lazy = true, event = "VeryLazy" },
	{ "ellisonleao/gruvbox.nvim", priority = 1000, lazy = true, event = "VeryLazy" },
	{ "xiantang/darcula-dark.nvim", priority = 1000, lazy = true, event = "VeryLazy" },
	{ "nyoom-engineering/oxocarbon.nvim", priority = 1000, lazy = true, event = "VeryLazy" },
	{ "archseer/colibri.vim", priority = 1000, lazy = true, event = "VeryLazy" },
	{ "fxn/vim-monochrome", priority = 1000, lazy = true, event = "VeryLazy" },
	{ "jaredgorski/Mies.vim", priority = 1000, lazy = true, event = "VeryLazy" },
	{ "jaredgorski/fogbell.vim", priority = 1000, lazy = true, event = "VeryLazy" },
	{ "p00f/alabaster.nvim", priority = 1000, lazy = true, event = "VeryLazy" },
	{ "felipec/vim-felipec", priority = 1000, lazy = true, event = "VeryLazy" },
	{ "projekt0n/github-nvim-theme", priority = 1000, lazy = true, event = "VeryLazy" },
	{ "xero/miasma.nvim", priority = 1000, lazy = true, event = "VeryLazy" },
	{ "rose-pine/neovim", priority = 1000, lazy = true, event = "VeryLazy", name = "rose-pine" },
	{ "Mofiqul/vscode.nvim", priority = 1000, lazy = true, event = "VeryLazy" },
	{ "danishprakash/vim-yami", priority = 1000, lazy = true, event = "VeryLazy" },
	{ "robertmeta/nofrils", priority = 1000, lazy = true, event = "VeryLazy" },
	{ "folke/tokyonight.nvim", priority = 1000, lazy = true, event = "VeryLazy" },
	{ "andreasvc/vim-256noir", priority = 1000, lazy = true, event = "VeryLazy" },
	{ "ewilazarus/preto", priority = 1000, lazy = true, event = "VeryLazy" },
	{ "VonHeikemen/rubber-themes.vim", priority = 1000, lazy = true, event = "VeryLazy" },
	{ "thenewvu/vim-colors-arthur", priority = 1000, lazy = true, event = "VeryLazy" },
	{ "saulhoward/kaodam", priority = 1000, lazy = true, event = "VeryLazy" },
}
