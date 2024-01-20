return {
	"nvim-treesitter/nvim-treesitter",
	event = "VeryLazy",
	dependencies = {
		{ "windwp/nvim-ts-autotag" }, -- html auto tag
		{ "nvim-treesitter/nvim-treesitter-refactor" }, -- highlight usages, definition, etc
		{ "JoosepAlviste/nvim-ts-context-commentstring" }, -- for Comment.nvim
	},

	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "vimdoc", "typescript", "lua", "go", "bash", "tsx", "javascript", }, -- A list of parser names, or "all"
			sync_install = false, -- Install parsers synchronously (only applied to `ensure_installed`)
			auto_install = false, -- Automatically install missing parsers when entering buffer

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
				use_languagetree = true,
				-- disable = function(_, bufnr)
				-- 	local buf_name = vim.api.nvim_buf_get_name(bufnr)
				-- 	local file_size = vim.api.nvim_call_function("getfsize", { buf_name })
				-- 	return file_size > 256 * 1024
				-- end,
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
			indent = { enable = true, disable = { "yaml" } },
			autotag = {
				enable = true, -- auto close html tag
				enable_close_on_slash = false,
			},
			refactor = {
				highlight_definitions = {
					enable = true,
					clear_on_cursor_move = false,
					enable_rename = true,
					enable_close = true,
				},
			},
		})
	end,
}
