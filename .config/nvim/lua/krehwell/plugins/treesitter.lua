return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = "BufReadPre",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-refactor",
		"nvim-treesitter/nvim-treesitter-textobjects",
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

		refactor = {
			highlight_definitions = {
				enable = true,
				-- Set to false if you have an `updatetime` of ~100.
				clear_on_cursor_move = true,
			},
		},

		indent = { enable = true },

		textobjects = {
			move = {
				enable = true,
				set_jumps = true, -- Adds location to the jump list

				goto_previous_start = {
					["[m"] = { query = "@function.outer", desc = "Previous function start" },
				},
				goto_next_start = {
					["]m"] = { query = "@function.outer", desc = "Next function start" },
				},
			},
		},
	},

	config = function(_, opts)
		vim.opt.smartindent = true
		require("nvim-treesitter.configs").setup(opts)
	end,
}
