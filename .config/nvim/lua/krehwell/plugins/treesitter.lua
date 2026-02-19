return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = "BufReadPre",
	branch = "master",

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
			enable = true, -- keep enabled generally
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

	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
