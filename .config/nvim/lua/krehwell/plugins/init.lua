return {
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"nvim-treesitter/nvim-treesitter-refactor",
	"JoosepAlviste/nvim-ts-context-commentstring",
	{ "windwp/nvim-ts-autotag", event = "InsertEnter" },
	"jose-elias-alvarez/null-ls.nvim", -- formatter, etc
	{ "folke/neodev.nvim", ft = { "lua", "vim" } }, -- improve sumneko with vim :')
	{ "isomoar/vim-css-to-inline", event = "InsertEnter" }, -- css to jsx inline
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
			},
			{ "williamboman/mason-lspconfig.nvim" },

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
	{ "tpope/vim-fugitive", event = "VeryLazy" },
	{ "lewis6991/gitsigns.nvim", event = "CursorMoved" },
	{ "tpope/vim-rhubarb", cmd = "GBrowse" },
	{ "numToStr/Comment.nvim", event = "InsertEnter" },
	{ "tpope/vim-surround", event = "InsertEnter" },
	{ "tpope/vim-repeat", event = "InsertEnter" },
	{
		"ojroques/vim-oscyank",
		branch = "main",
		keys = {
			{ "<C-c>", ":OSCYankVisual<CR>", desc = "Copy to clipboard", mode = "v", silent = true },
		},
		init = function()
			vim.g.oscyank_term = "default"
		end,
	},
	{
		"mbbill/undotree",
		lazy = true,
		keys = {
			{ "<leader>u", ":UndotreeToggle<CR>:UndotreeFocus<CR>" },
		},
	},
	{
		"folke/todo-comments.nvim",
		event = "VeryLazy",
		opts = {
			signs = false,
			highlight = {
				multiline = false, -- enable multine todo comments
			},
		},
	},
	{
		"j-hui/fidget.nvim",
		opts = {
			window = {
				relative = "win",
				blend = 0,
				zindex = nil,
				border = "none",
			},
		},
	},
	"gelguy/wilder.nvim",
	{
		"brenoprata10/nvim-highlight-colors",
		event = "CursorMoved",
		opts = {
			render = "background", -- or 'foreground' or 'first_column'
			enable_named_colors = true,
			enable_tailwind = true,
		},
	},
	{ "pbrisbin/vim-colors-off", priority = 1000, lazy = true },
	{ "morhetz/gruvbox", priority = 1000, lazy = true, event = "VeryLazy" },
	{ "archseer/colibri.vim", priority = 1000, lazy = true, event = "VeryLazy" },
}
