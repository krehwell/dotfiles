return {
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"nvim-treesitter/nvim-treesitter-refactor",
	"JoosepAlviste/nvim-ts-context-commentstring",
	{ "windwp/nvim-ts-autotag", event = "InsertEnter" },
	"jose-elias-alvarez/null-ls.nvim", -- formatter, etc
	"folke/neodev.nvim", -- improve sumneko with vim :')
	{ "isomoar/vim-css-to-inline", event = "InsertEnter" }, -- css to jsx inline
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{
				-- Optional
				"williamboman/mason.nvim",
				build = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
		},
	},
	"nvim-lua/plenary.nvim",
	"nvim-lua/popup.nvim",
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = vim.fn.executable("make") == 1 },
	{ "lewis6991/gitsigns.nvim", event = "CursorMoved" },
	"tpope/vim-fugitive",
	{ "tpope/vim-rhubarb", cmd = "GBrowse" },
	{ "numToStr/Comment.nvim", event = "InsertEnter" },
	{ "tpope/vim-surround", event = "InsertEnter" },
	{ "tpope/vim-repeat", event = "InsertEnter" },
	{ "monaqa/dial.nvim", event = "InsertEnter" },
	{ "ojroques/vim-oscyank", branch = "main", event = "ModeChanged" },
	{
		"mbbill/undotree",
		lazy = true,
		keys = {
			{ "<leader>u", ":UndotreeToggle<CR>:UndotreeFocus<CR>" },
		},
	},
	"folke/todo-comments.nvim",
	"j-hui/fidget.nvim",
	"gelguy/wilder.nvim",
	{ "brenoprata10/nvim-highlight-colors", event = "CursorMoved" },
	{ "pbrisbin/vim-colors-off", priority = 100, lazy = true },
	{ "morhetz/gruvbox", priority = 100, lazy = true },
	{ "archseer/colibri.vim", priority = 100, lazy = true },
}
