return {
	-- LSP helper related
	{
		"folke/trouble.nvim",
		opts = {},
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
		},
	},
	{
		"axelvc/template-string.nvim",
		config = function()
			require("template-string").setup({
				filetypes = {
					"html",
					"typescript",
					"javascript",
					"typescriptreact",
					"javascriptreact",
					"vue",
					"svelte",
					"python",
					"cs",
				},
				jsx_brackets = true, -- must add brackets to JSX attributes
				remove_template_string = true, -- remove backticks when there are no template strings
				restore_quotes = {
					normal = [["]],
					jsx = [["]],
				},
			})
		end,
	},

	-- MARKDOWN PREVIEWER
	{
		"toppair/peek.nvim",
		event = { "VeryLazy" },
		ft = { "markdown", "md" },
		build = "deno task --quiet build:fast",
		config = function()
			require("peek").setup()
			vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
			vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
		end,
	},

	-- HELPERS/NAVIGATIONS
	{
		"stevearc/quicker.nvim",
		event = "FileType qf",
		---@module "quicker"
		---@type quicker.SetupOptions
		opts = {
			wrap = false,
		},
		config = function()
			require("quicker").setup({
				keys = {
					{
						">",
						function()
							require("quicker").expand({ before = 2, after = 2, add_to_existing = true })
						end,
						desc = "Expand quickfix context",
					},
					{
						"<",
						function()
							require("quicker").collapse()
						end,
						desc = "Collapse quickfix context",
					},
				},
			})
		end,
	},
	{
		"justinmk/vim-gtfo",
		keys = { { "gof", desc = "Go to folder" }, { "got", desc = "Go to terminal" } },
	},
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
		"mbbill/undotree",
		cmd = { "UndotreeToggle", "UndotreeFocus" },
		keys = {
			{ "<leader>u", ":UndotreeToggle<CR>:UndotreeFocus<CR>", desc = "Toggle undotree", mode = "n" },
		},
		init = function()
			vim.g.undotree_SetFocusWhenToggle = 1
		end,
	},

	-- BEAUTIFY
	{
		"echasnovski/mini.icons",
		version = false,
		event = "BufReadPre",
		config = function()
			require("mini.icons").setup()
		end,
	},
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		event = "LspAttach",
		opts = { window = { relative = "win", blend = 0, zindex = nil, border = "none" } },
	},
	{
		"uga-rosa/ccc.nvim",
		event = "BufReadPre",
		config = function()
			local ccc = require("ccc")
			ccc.setup({
				highlighter = {
					auto_enable = true,
					lsp = true,
				},
			})
		end,
		keys = {
			{
				"<leader>c",
				"<cmd>:CccConvert<CR>",
				desc = "Toggle highlight color",
			},
		},
	},
	-- { "p00f/alabaster.nvim", priority = 1000, event = "VeryLazy" },
	-- { "projekt0n/github-nvim-theme", priority = 1000, event = "VeryLazy" },
	-- { "xero/miasma.nvim", priority = 1000, event = "VeryLazy" },
	-- { "sainnhe/gruvbox-material", event = "VeryLazy", priority = 1000 },
	-- { "HoNamDuong/hybrid.nvim", event = "VeryLazy", priority = 1000 },
}
