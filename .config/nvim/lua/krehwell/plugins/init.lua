return {
	-- LSP
	"jose-elias-alvarez/null-ls.nvim", -- formatter, etc
	{ "folke/neodev.nvim", ft = { "lua", "vim" } }, -- improve sumneko with vim :')
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

			-- AUTOCOMPLETE
			{
				"hrsh7th/nvim-cmp",
				dependencies = {
					{ "hrsh7th/cmp-calc", event = "InsertEnter" },
					{ "hrsh7th/cmp-path", event = "InsertEnter" },
					{ "hrsh7th/cmp-nvim-lsp-signature-help", event = "InsertEnter" },
					{ "hrsh7th/cmp-nvim-lsp" },
				},
			},
			{ "L3MON4D3/LuaSnip", event = "InsertEnter" },
		},
	},

	-- GIT
	{ "tpope/vim-fugitive", event = "VeryLazy" },
	{ "lewis6991/gitsigns.nvim", event = "CursorMoved" },
	{ "tpope/vim-rhubarb", cmd = "GBrowse" },

	-- MODIFICATION/NAVIGATIONS
	{ "isomoar/vim-css-to-inline", event = "CursorMoved" }, -- css to jsx inline
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
			{ "<C-c>", ":OSCYankVisual<CR>", desc = "Copy to clipboard", mode = "v", silent = true },
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
			{ "<C-p>", "<Plug>(VM-Select-Previous)", desc = "Select previous match", mode = { "n", "v" } },
		},
	},

	-- BEAUTIFY
	{
		"folke/todo-comments.nvim",
		event = { "VeryLazy", "CursorMoved" },
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
	{ "pbrisbin/vim-colors-off", priority = 1000, lazy = true },
	{ "morhetz/gruvbox", priority = 1000, lazy = true, event = "VeryLazy" },
	{ "archseer/colibri.vim", priority = 1000, lazy = true, event = "VeryLazy" },
}
