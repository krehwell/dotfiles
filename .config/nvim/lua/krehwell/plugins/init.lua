return {
	-- LSP
	{ "folke/neodev.nvim", ft = { "lua", "vim" } }, -- improve lua with vim :')
	{
		"dmmulroy/ts-error-translator.nvim",
		event = "LspAttach",
		ft = { "ts", "tsx", "js", "jsx" },
		config = function()
			require("ts-error-translator").setup()
		end,
	},
	{ "zeioth/garbage-day.nvim", dependencies = "neovim/nvim-lspconfig", event = "LspAttach" },
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = "TroubleToggle",
		keys = {
			{ "<leader>xx", ":lua require('trouble').toggle()<CR>", desc = "Trouble toggle" },
			{
				"<leader>xw",
				"require('trouble').toggle('workspace_diagnostics')<CR>",
				desc = "Trouble Workspace Diagnostics",
			},
			{
				"<leader>xd",
				"require('trouble').toggle('document_diagnostics')<CR>",
				desc = "Trouble Document Diagnostics",
			},
			{ "<leader>xq", "require('trouble').toggle('quickfix')<CR>", desc = "Trouble Quickfix" },
			{ "<leader>xl", "require('trouble').toggle('loclist')<CR>", desc = "Trouble Location List" },
		},
	},
	{ "chrisgrieser/nvim-early-retirement", event = "LspAttach", opts = { retirementAgeMins = 15 } },

	-- HELPERS/NAVIGATIONS
	{
		"echasnovski/mini.move",
		version = false,
		event = "CursorMoved",
		config = function()
			require("mini.move").setup({})
		end,
	},
	{
		"folke/flash.nvim",
		opts = {
			label = { style = "overlay" },
			modes = { char = { enabled = false }, search = { enabled = false } },
		},
		keys = {
			{
				"//",
				function()
					require("flash").jump({ search = { multi_window = true } })
				end,
				desc = "Flash search forward",
			},
			{
				"??",
				function()
					require("flash").jump({ search = { multi_window = true } })
				end,
				desc = "Flash search backwards",
			},
		},
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
		keys = { { "u", desc = "Undo" } },
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

	-- BEAUTIFY
	{
		"dhananjaylatkar/notes.nvim",
		cmd = { "NotesFind", "NotesGrep", "NotesNew" },
		opts = {
			root = os.getenv("HOME") .. "/.vim/notes/",
		},
	},
	{
		"echasnovski/mini.notify",
		version = false,
		event = "LspAttach",
		config = function()
			require("mini.notify").setup()
		end,
	},
	{
		"uga-rosa/ccc.nvim",
		event = { "CursorMoved" },
		config = function()
			require("ccc").setup({
				highlighter = { auto_enable = true, lsp = true },
			})
		end,
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
	{
		"tamton-aquib/duck.nvim",
		event = { "CursorMoved" },
		config = function()
			function SpawnDuck(n)
				local spawn_one = function()
					local candidates = { "🦆", "🦀", "🐈", "🦖", "🐤", "🐶" }
					local index = math.random(#candidates)
					local candidate = candidates[index]

					local speeds = { { slow = 1 }, { normal = 3 }, { fast = 5 } }
					index = math.random(#speeds)
					local speed = speeds[index].fast
					require("duck").hatch(candidate, speed)
				end
				for _ = 1, n do
					spawn_one()
				end
			end
		end,
	},

	-- THEME/COLORSCHEME
	-- { "p00f/alabaster.nvim", priority = 1000,  event = "CursorMoved" },
	{ "projekt0n/github-nvim-theme", priority = 1000, event = "CursorMoved" },
	{ "xero/miasma.nvim", priority = 1000, event = "CursorMoved" },
	{ "sainnhe/gruvbox-material", event = "CursorMoved", priority = 1000 },
	{
		dir = "../../mirec/init.lua",
		name = "mirec",
		config = function()
			require("mirec").setup({})
		end,
	},
}
