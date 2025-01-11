return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = "BufReadPre",
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter-refactor" }, -- highlight usages, definition, etc
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
			use_languagetree = true,
			additional_vim_regex_highlighting = true,
			-- disable = function(lang, buf)
			-- 	local max_filesize = 10 * 1024
			-- 	local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			-- 	if ok and stats and stats.size > max_filesize then
			-- 		return true
			-- 	end
			-- end,
		},

		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<c-space>",
				node_incremental = "<c-space>",
				scope_incremental = "<c-a>",
				node_decremental = "", -- this is <C-BS>
			},
		},

		indent = { enable = true },

		refactor = {
			highlight_definitions = {
				enable = true,
				clear_on_cursor_move = true,
			},
			highlight_current_scope = { enable = false },
		},

		textobjects = {
			move = {
				enable = true,
				set_jumps = false,
				goto_next_start = {
					["]]"] = "@function.outer",
				},
				goto_previous_start = {
					["[["] = "@function.outer",
				},
			},

			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ac"] = "@class.outer",
					["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
				},
				selection_modes = {
					["@parameter.outer"] = "v", -- charwise
					["@function.outer"] = "V", -- linewise
					["@class.outer"] = "<c-v>", -- blockwise
				},
				include_surrounding_whitespace = true,
			},
		},
	},

	config = function(_, opts)
		vim.opt.smartindent = true
		require("nvim-treesitter.configs").setup(opts)
	end,
}
