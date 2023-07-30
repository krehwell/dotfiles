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
	{
    -- js inline toggler
		"llllvvuu/nvim-js-actions",
		ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
				command = "nnoremap <buffer> <leader>it " .. ":lua require('nvim-js-actions').js_arrow_fn.toggle()<CR>",
				-- can also do `require('nvim-js-actions/js-arrow-fn').toggle()`
			})
		end,
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
	{ "tpope/vim-repeat", keys = { { "." } } },
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
		"chrisgrieser/nvim-early-retirement",
		config = true,
		event = "VeryLazy",
		opts = {
			retirementAgeMins = 10,
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
	{ "morhetz/gruvbox", priority = 1000, lazy = true, event = "VeryLazy" },
	{ "xiantang/darcula-dark.nvim", priority = 1000, lazy = true, event = "VeryLazy" },
}
