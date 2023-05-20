return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		{ "windwp/nvim-ts-autotag" }, -- html auto tag
		{ "nvim-treesitter/nvim-treesitter-refactor" }, -- highlight usages, definition, etc
		{ "JoosepAlviste/nvim-ts-context-commentstring" }, -- for Comment.nvim
	},

	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "vimdoc", "javascript", "typescript", "lua" }, -- A list of parser names, or "all"
			sync_install = false, -- Install parsers synchronously (only applied to `ensure_installed`)
			auto_install = true, -- Automatically install missing parsers when entering buffer

			highlight = {
				enable = false, -- `false` will disable the whole extension

				-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
				-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
				-- the name of the parser)
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
				enable = true, -- close html tag
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
