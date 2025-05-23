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
			use_languagetree = true,
			additional_vim_regex_highlighting = true,
			disable = function(lang, buf)
				local max_filesize = 10 * 1024
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
				scope_incremental = "<c-a>",
				node_decremental = "<BS>", -- this is <C-BS>
			},
		},

		indent = { enable = true },
	},

	config = function(_, opts)
		vim.opt.smartindent = true

		require("nvim-treesitter.configs").setup(opts)
	end,
}
