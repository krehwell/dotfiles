return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = "VeryLazy",
	dependencies = {
		{ "windwp/nvim-ts-autotag" }, -- html auto tag
		{ "nvim-treesitter/nvim-treesitter-refactor" }, -- highlight usages, definition, etc
	},

	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "vimdoc", "typescript", "lua", "go", "bash", "tsx", "javascript", "vim", "css" },
			sync_install = false,
			auto_install = true,

			highlight = {
				enable = false,
				use_languagetree = false,
				additional_vim_regex_highlighting = false,
				disable = function(lang, buf)
					local max_filesize = 100 * 1024 -- 50 KB
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
					node_decremental = "<c-backspace>",
				},
			},

			autotag = { enable = true },

			indent = { enable = true },

			refactor = {
				highlight_definitions = {
					enable = true,
					clear_on_cursor_move = true,
				},
				highlight_current_scope = { enable = false },
			},
		})
	end,
}
