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

	-- lsp related
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-refactor")
	use("jose-elias-alvarez/null-ls.nvim") -- formatter, etc
	use("zbirenbaum/neodim") -- dim unused var
	use("folke/neodev.nvim") -- improve sumneko with vim :')
	use("github/copilot.vim")
	use("isomoar/vim-css-to-inline") -- css to jsx inline
	use({
		"VonHeikemen/lsp-zero.nvim",
		requires = {
			-- lsp support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	})

	-- telescope related
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")
	use("nvim-telescope/telescope.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make", cond = vim.fn.executable("make") == 1 })

	-- git related
	use("lewis6991/gitsigns.nvim")
	use("tpope/vim-fugitive")

	-- movement/navigation
	use({ "numToStr/Comment.nvim" })
	use("tpope/vim-surround")
	use("tpope/vim-repeat")
	use("windwp/nvim-ts-autotag") -- for html tag
	use("windwp/nvim-autopairs") -- for normal enclosing bracket
	use("mg979/vim-visual-multi")
	use({
		"lambdalisue/fern.vim",
		requires = {
			"lambdalisue/fern-git-status.vim",
			"lambdalisue/nerdfont.vim",
			"lambdalisue/fern-renderer-nerdfont.vim",
			"lambdalisue/fern-hijack.vim",
		},
	})

	-- status/helper
	use("mbbill/undotree")
	use("nvim-lualine/lualine.nvim")
	use("vimpostor/vim-tpipeline")
	use({ "ojroques/vim-oscyank", branch = "main" })

	-- beauty
	use("nvim-tree/nvim-web-devicons")
	use("pbrisbin/vim-colors-off")
	use("rakr/vim-one")
	use("folke/todo-comments.nvim")
	use("folke/zen-mode.nvim")
	use("folke/twilight.nvim")
	use("j-hui/fidget.nvim")
  use("norcalli/nvim-colorizer.lua")

	-- automatically set up your configuration after cloning packer.nvim
	-- must be at bottom most
	if Packer_Bootstrap then
		require("packer").sync()
	end
end)
