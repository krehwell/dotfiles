return {
	"Bekaboo/dropbar.nvim",
	dependencies = {
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
	ft = require("krehwell.lsp-utils").fts,
	opts = {
		icons = {
			kinds = {
				symbols = {
					File = " ",
				},
			},
		},
		sources = {
			treesitter = {
				valid_types = {
					"constructor",
					"function",
				},
                max_depth = 2,
			},
			lsp = {
				valid_types = {
					"constructor",
					"function",
				},
                max_depth = 2,
			},
		},
	},
	config = function(_, opts)
		require("dropbar").setup(opts)
	end,
}
