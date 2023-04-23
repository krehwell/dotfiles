local fn = vim.fn

-- Automatically install packer on initial startup
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	Packer_Bootstrap =
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	print("---------------------------------------------------------")
	print("Press Enter to install packer and plugins.")
	print("After install -- close and reopen Neovim to load configs!")
	print("---------------------------------------------------------")
	vim.cmd([[packadd packer.nvim]])
end

local present, packer = pcall(require, "packer")
if not present then
	return
end

packer.startup(function(use)
	use("wbthomason/packer.nvim")

	-- treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-refactor")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("windwp/nvim-ts-autotag")

	-- lsp related
	use("jose-elias-alvarez/null-ls.nvim") -- formatter, etc
	use("folke/neodev.nvim") -- improve sumneko with vim :')
	use("isomoar/vim-css-to-inline") -- css to jsx inline
	use("github/copilot.vim")

	-- lsp-zero
	use({
		"VonHeikemen/lsp-zero.nvim",
		requires = {
			-- lsp support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-calc" },
			{ "hrsh7th/cmp-buffer" },
			{ "f3fora/cmp-spell" },
			{ "hrsh7th/cmp-nvim-lsp-signature-help" },

			-- snippets
			{ "L3MON4D3/LuaSnip" },
			-- { "rafamadriz/friendly-snippets" },
		},
	})

	-- telescope related
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make", cond = vim.fn.executable("make") == 1 })
	-- use("dharmx/telescope-media.nvim")

	-- git related
	use("lewis6991/gitsigns.nvim")
	use("tpope/vim-fugitive")
	use("tpope/vim-rhubarb")

	-- movement/navigation
	use({ "numToStr/Comment.nvim" })
	use("tpope/vim-surround")
	use("tpope/vim-repeat")
	use("windwp/nvim-autopairs") -- for normal enclosing bracket
	use("mg979/vim-visual-multi")
  use("monaqa/dial.nvim")

	-- status/helper
	use({
		"lambdalisue/fern.vim",
		requires = {
			"lambdalisue/fern-git-status.vim",
			"lambdalisue/nerdfont.vim",
			"lambdalisue/fern-renderer-nerdfont.vim",
			"lambdalisue/fern-hijack.vim",
		},
	})
	use({ "ojroques/vim-oscyank", branch = "main" })
	use("mbbill/undotree")
	-- use("nvim-lualine/lualine.nvim")
	-- use("vimpostor/vim-tpipeline")
	use({
		"utilyre/barbecue.nvim",
		tag = "*",
		requires = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		after = "nvim-web-devicons", -- keep this if you're using NvChad
	})

	-- beauty
	use("nvim-tree/nvim-web-devicons")
	use("pbrisbin/vim-colors-off")
	use("folke/todo-comments.nvim")
	use("j-hui/fidget.nvim")
	use("gelguy/wilder.nvim")
	-- colorscheme
	use("brenoprata10/nvim-highlight-colors")
	use("morhetz/gruvbox")
  use("archseer/colibri.vim")

	-- automatically set up your configuration after cloning packer.nvim
	-- must be at bottom most
	if Packer_Bootstrap then
		require("packer").sync()
	end
end)
