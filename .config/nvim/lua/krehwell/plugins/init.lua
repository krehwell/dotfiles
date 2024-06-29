return {
	-- LSP
	{
		"zeioth/garbage-day.nvim",
		dependencies = "neovim/nvim-lspconfig",
		event = "InsertEnter",
		-- opts = { aggressive_mode = true },
	},
	{
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
		keys = {
			{ "<leader>xx", ":lua require('trouble').toggle()<CR>", desc = "Trouble toggle" },
			{
				"<leader>xw",
				":lua require('trouble').toggle('workspace_diagnostics')<CR>",
				desc = "Trouble Workspace Diagnostics",
			},
			{
				"<leader>xd",
				":lua require('trouble').toggle('document_diagnostics')<CR>",
				desc = "Trouble Document Diagnostics",
			},
			{ "<leader>xq", "require('trouble').toggle('quickfix')<CR>", desc = "Trouble Quickfix" },
			{ "<leader>xl", "require('trouble').toggle('loclist')<CR>", desc = "Trouble Location List" },
		},
	},
	{ "chrisgrieser/nvim-early-retirement", event = "InsertEnter", opts = { retirementAgeMins = 20 } },
	-- { "dmmulroy/ts-error-translator.nvim", event = "LspAttach", ft = { "typescript", "typescriptreact" } },

	-- HELPERS/NAVIGATIONS
	{
		"justinmk/vim-gtfo",
		keys = { { "gof", desc = "Go to folder" }, { "got", desc = "Go to terminal" } },
	},
	{
		"echasnovski/mini.move",
		keys = {
			{ mode = "v", "<M-l>" },
			{ mode = "v", "<M-j>" },
			{ mode = "v", "<M-h>" },
			{ mode = "v", "<M-k>" },
		},
		config = function()
			require("mini.move").setup({})
		end,
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
	},
	-- {
	-- 	"kevinhwang91/nvim-fundo",
	-- 	keys = { { "u", desc = "Undo" } },
	-- 	dependencies = {
	-- 		{
	-- 			"kevinhwang91/promise-async",
	-- 			build = function()
	-- 				require("fundo").install()
	-- 			end,
	-- 		},
	-- 	},
	-- 	config = function()
	-- 		vim.o.undofile = true
	-- 		require("fundo").setup()
	-- 	end,
	-- },
	{
		"mg979/vim-visual-multi",
		keys = { { "<C-n>", "<Plug>(VM-Select-Next)", desc = "Select next match", mode = { "n", "v" } } },
	},

	-- BEAUTIFY
	{
		"yujinyuz/gitpad.nvim",
		cmd = { "Note", "NoteBranch" },
		keys = {
			{
				"<leader>n",
				function()
					require("gitpad").toggle_gitpad()
				end,
				desc = "Open note (gitpad)",
			},
			{
				"<leader>b",
				function()
					require("gitpad").toggle_gitpad_branch()
				end,
				desc = "Open note per branch (gitpad)",
			},
		},
		config = function()
			require("gitpad").setup({
				dir = os.getenv("HOME") .. "/.vim/notes/",
				on_attach = function(bufnr)
					vim.api.nvim_buf_set_keymap(bufnr, "n", "q", "<Cmd>wq<CR>", { noremap = true, silent = true })
					vim.api.nvim_buf_set_keymap(bufnr, "n", "<c-[>", "<Cmd>wq<CR>", { noremap = true, silent = true })
				end,
			})

			vim.api.nvim_create_user_command("Note", function()
				require("gitpad").toggle_gitpad()
			end, { nargs = 0 })

			vim.api.nvim_create_user_command("NoteBranch", function()
				require("gitpad").toggle_gitpad_branch()
			end, { nargs = 0 })
		end,
	},
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		event = "LspAttach",
		opts = { window = { relative = "win", blend = 0, zindex = nil, border = "none" } },
	},
	{
		"nvim-tree/nvim-web-devicons",
		event = "BufReadPre",
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
		cmd = { "SpawnDuck" },
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

			function KillDuck()
				require("duck").cook_all()
			end

			vim.api.nvim_create_user_command("SpawnDuck", function()
				SpawnDuck(2)
			end, { nargs = 0 })
		end,
	},
	{ "p00f/alabaster.nvim", priority = 1000, event = "VeryLazy" },
	{ "projekt0n/github-nvim-theme", priority = 1000, event = "VeryLazy" },
	{ "xero/miasma.nvim", priority = 1000, event = "VeryLazy" },
	{ "sainnhe/gruvbox-material", event = "VeryLazy", priority = 1000 },
}
