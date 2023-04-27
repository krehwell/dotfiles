return {
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"nvim-treesitter/nvim-treesitter-refactor",
	"JoosepAlviste/nvim-ts-context-commentstring",
	"windwp/nvim-ts-autotag",
	"jose-elias-alvarez/null-ls.nvim", -- formatter, etc
	"folke/neodev.nvim", -- improve sumneko with vim :')
	"isomoar/vim-css-to-inline", -- css to jsx inline
	"github/copilot.vim",
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
	"lewis6991/gitsigns.nvim",
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
	{ "numToStr/Comment.nvim" },
	"tpope/vim-surround",
	"tpope/vim-repeat",
	"windwp/nvim-autopairs", -- for normal enclosing bracket("mg979/vim-visual-multi")
	"monaqa/dial.nvim",
	{
		"lambdalisue/fern.vim",
		dependencies = {
			"lambdalisue/fern-git-status.vim",
			"lambdalisue/nerdfont.vim",
			"lambdalisue/fern-renderer-nerdfont.vim",
			"lambdalisue/fern-hijack.vim",
		},
	},
	{ "ojroques/vim-oscyank", branch = "main" },
	"mbbill/undotree",
	"nvim-tree/nvim-web-devicons",
	"pbrisbin/vim-colors-off",
	"folke/todo-comments.nvim",
	"j-hui/fidget.nvim",
	"gelguy/wilder.nvim",
	"brenoprata10/nvim-highlight-colors",
	"morhetz/gruvbox",
	"archseer/colibri.vim",
}
