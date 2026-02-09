return {
	"Bekaboo/dropbar.nvim",
	-- enabled = false,
	opts = {
		icons = { kinds = { symbols = { File = " " } } },
		sources = {
			treesitter = {
				-- only show this things, I don't need deep complex dropbar info
				valid_types = { "constructor", "function" },
				max_depth = 2,
			},
			lsp = {
				-- only show this things, I don't need deep complex dropbar info
				valid_types = { "constructor", "function" },
				max_depth = 2,
			},
		},
	},
	config = function(_, opts)
		-- don't need statusline as it's now replaced with dropbar
		vim.cmd([[ let &statusline='%#WinSeparator#' ]])
		require("dropbar").setup(opts)
	end,
}
