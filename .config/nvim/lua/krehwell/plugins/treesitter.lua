return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = "VeryLazy",
	dependencies = {
		{ "windwp/nvim-ts-autotag" }, -- html auto tag
		{ "nvim-treesitter/nvim-treesitter-refactor" }, -- highlight usages, definition, etc
		-- { "nvim-treesitter/nvim-treesitter-textobjects" },
	},

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
			enable = false,
			use_languagetree = false,
			additional_vim_regex_highlighting = false,
			disable = function(lang, buf)
				local max_filesize = 10 * 1024 -- 50 KB
				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				if ok and stats and stats.size > max_filesize then
					return true
				end
			end,
		},

		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<c-space>",
				node_incremental = "<c-space>",
				scope_incremental = "<c-s>",
				node_decremental = "", -- this is <C-BS>
			},
		},

		-- for autotag to work properly for jsx file
		-- ~/.local/share/nvim/lazy/local/share/nvim/lazy/nvim-ts-autotag/lua/nvim-ts-autotag/internal.lua:570
		-- set `{ clear = false }`
		-- if want to update this plugin, set it back to true and update then reset it back to false
		autotag = { enable = true },

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
					["]m"] = { query = "@class.outer", desc = "Next class start" },
				},
				goto_next_end = {
					["]["] = "@function.outer",
					["]M"] = "@class.outer",
				},
				goto_previous_start = {
					["[["] = "@function.outer",
					["[m"] = "@class.outer",
				},
				goto_previous_end = {
					["[]"] = "@function.outer",
					["[M"] = "@class.outer",
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
		require("nvim-treesitter.configs").setup(opts)
	end,
}
