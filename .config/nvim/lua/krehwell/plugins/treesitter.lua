return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = "BufReadPre",
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter-textobjects" },
	},

	-- enabled = false,

	opts = {
		ensure_installed = {
			"go",
			"bash",
			"vim",
			"css",
			"typescript",
			"tsx",
			"javascript",
			"html",
			"vimdoc",
			"lua",
			"json",
			"query",
		},

		sync_install = false,
		auto_install = true,

		highlight = {
			enable = true,
			use_languagetree = false,
			additional_vim_regex_highlighting = false,
		},

		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<c-space>",
				node_incremental = "<c-space>",
				scope_incremental = "<c-a>",
				node_decremental = "<BS>", -- this is <C-BS>
			},
		},

		indent = { enable = true },
	},

	textobjects = {
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				["]]"] = "@function.outer",
			},
			goto_previous_start = {
				["[["] = "@function.outer",
			},
		},
	},

	config = function(_, opts)
		vim.opt.smartindent = false
		require("nvim-treesitter.configs").setup(opts)
	end,
}
