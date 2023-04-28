return {
	"utilyre/barbecue.nvim",
	name = "barbecue",
	version = "*",
	lazy = false,
	dependencies = {
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons", -- optional dependency
	},
	keys = {
		{ "[[", ":lua require('barbecue.ui').navigate(-1)<CR>", desc = "jump to parent function", silent = true },
	},
	opts = {
		-- create_autocmd = false,
		show_dirname = true,
		show_modified = true,
		modifiers = {
			dirname = ":h:t",
			basename = "",
		},
		theme = {
			normal = { bg = "#303030", fg = "#c6c6c6" },
		},
		symbols = {
			modified = "+",
			ellipsis = "…",
			separator = ">",
		},
	},
	init = function()
		vim.opt.laststatus = 0
	end,
}
