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
				opts = { ui = { border = "rounded" } },
			},
			{ "williamboman/mason-lspconfig.nvim" },
		},
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
		"JellyApple102/flote.nvim",
		cmd = "Flote",
		config = function()
			require("flote").setup({
				q_to_quit = true,
				window_style = "minimal",
				window_border = "rounded",
				window_title = true,
				notes_dir = os.getenv("HOME") .. "/.vim/flote",
				files = {
					global = "flote-global.md",
					cwd = function()
						local bufPath = vim.api.nvim_buf_get_name(0)
						local cwd = require("lspconfig").util.root_pattern(".git")(bufPath)
						return cwd
					end,
					file_name = function(cwd)
						local base_name = vim.fs.basename(cwd)
						local parent_base_name = vim.fs.basename(vim.fs.dirname(cwd))
						return parent_base_name .. "_" .. base_name .. ".md"
					end,
				},
			})
		end,
	},
	{
		"folke/todo-comments.nvim",
		event = { "LspAttach" },
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
		event = { "CursorMoved" },
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
	{
		"tamton-aquib/duck.nvim",
		keys = {
			{
				"<localleader>pp",
				function()
					local candidates = { "🦆", "🦀", "🐈", "🦖", "🐤", "🐶" }
					local index = math.random(#candidates)
					local candidate = candidates[index]

					local speeds = { { slow = 1 }, { normal = 3 }, { fast = 5 } }
					index = math.random(#speeds)
					local speed = speeds[index].fast
					require("duck").hatch(candidate, speed)
				end,
			},
			{
				"<localleader>pc",
				":lua require('duck').cook()<CR>",
			},
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
	{ "p00f/alabaster.nvim", priority = 1000, lazy = true, event = "VeryLazy" },
	{ "felipec/vim-felipec", priority = 1000, lazy = true, event = "VeryLazy" },
	{ "projekt0n/github-nvim-theme", priority = 1000, lazy = true, event = "VeryLazy" },
	{ "xero/miasma.nvim", priority = 1000, lazy = true, event = "VeryLazy" },
	{ "rose-pine/neovim", priority = 1000, lazy = true, event = "VeryLazy", name = "rose-pine" },
	{ "Mofiqul/vscode.nvim", priority = 1000, lazy = true, event = "VeryLazy" },
	{ "danishprakash/vim-yami", priority = 1000, lazy = true, event = "VeryLazy" },
	{ "robertmeta/nofrils", priority = 1000, lazy = true, event = "VeryLazy" },
	{ "folke/tokyonight.nvim", priority = 1000, lazy = true, event = "VeryLazy" },
	{ "VonHeikemen/rubber-themes.vim", priority = 1000, lazy = true, event = "VeryLazy" },
	{
		"sainnhe/gruvbox-material",
		event = "VeryLazy",
		priority = 1000,
		-- 	config = function()
		-- 		vim.o.background = "dark" -- or "light" for light mode
		-- 		vim.cmd("let g:gruvbox_material_background= 'hard'")
		-- 		vim.cmd("let g:gruvbox_material_transparent_background=2")
		-- 		vim.cmd("let g:gruvbox_material_diagnostic_line_highlight=1")
		-- 		vim.cmd("let g:gruvbox_material_diagnostic_virtual_text='colored'")
		-- 		vim.cmd("let g:gruvbox_material_enable_bold=1")
		-- 		vim.cmd("let g:gruvbox_material_enable_italic=1")
		-- 		-- vim.cmd([[colorscheme gruvbox-material]]) -- Set color scheme
		-- 		-- changing bg and border colors
		-- 		vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
		-- 		vim.api.nvim_set_hl(0, "LspInfoBorder", { link = "Normal" })
		-- 		vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
		-- 	end,
	},
}
