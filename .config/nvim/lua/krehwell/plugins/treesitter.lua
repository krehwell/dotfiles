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
			ensure_installed = { "vimdoc", "typescript", "lua", "go", "bash", "tsx" }, -- A list of parser names, or "all"
			sync_install = false, -- Install parsers synchronously (only applied to `ensure_installed`)
			auto_install = false, -- Automatically install missing parsers when entering buffer

			highlight = {
				enable = true, -- `false` will disable the whole extension

				-- list of language that will be disabled
				disable = {},

				-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
				-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
				-- Using this option may slow down your editor, and you may see some duplicate highlights.
				-- Instead of true it can also be a list of languages
				additional_vim_regex_highlighting = false,
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
			context_commentstring = {
				enable = true,
			},
			refactor = {
				highlight_definitions = {
					enable = true,
					clear_on_cursor_move = false,
				},
			},
		})
	end,
}
