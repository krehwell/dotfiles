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
	},
	config = function(_, opts) end,
}
