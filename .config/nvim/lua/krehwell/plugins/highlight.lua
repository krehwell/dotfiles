return {
	"uga-rosa/ccc.nvim",
	event = "BufReadPre",
	config = function()
		local ccc = require("ccc")
		ccc.setup({
			highlighter = {
				auto_enable = true,
				lsp = true,
			},
		})
	end,
	keys = {
		{
			"<leader>c",
			"<cmd>:CccConvert<CR>",
			desc = "Toggle highlight color",
		},
	},
}
