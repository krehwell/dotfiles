return {
	"utilyre/barbecue.nvim",
	name = "barbecue",
	version = "*",
	dependencies = {
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons", -- optional dependency
	},
	event = "VeryLazy",
	keys = {
		{ "[[", ":lua require('barbecue.ui').navigate(-1)<CR>", desc = "Jump to parent function", silent = true },
		{ "]]", ":lua require('barbecue.ui').navigate(2)", desc = "Jump to next function", silent = true },
	},
	opts = {
		show_dirname = true,
		show_modified = true,
		modifiers = {
			dirname = ":h:t",
			basename = "",
		},
		theme = {
			-- normal = { bg = "#262626", --[[ fg = "#c6c6c6" ]] },
		},
		symbols = {
			modified = "+",
			ellipsis = "…",
			separator = "",
		},
		exclude_filetypes = { "netrw", "toggleterm", "fern", "fern-replacer", "fzf", "Trouble" },
		kinds = {
			Module = "{}",
			Namespace = "{}",
			Object = "{}",
		},
		create_autocmd = false,
	},
	-- config = function(_, opts)
	-- -- triggers CursorHold event faster
	-- vim.opt.updatetime = 200
	--
	-- require("barbecue").setup(opts)
	--
	-- vim.api.nvim_create_autocmd({
	-- 	"WinScrolled",
	-- 	"BufWinEnter",
	-- 	"CursorHold",
	-- 	"InsertLeave",
	-- 	"BufModifiedSet",
	-- }, {
	-- 	group = vim.api.nvim_create_augroup("barbecue.updater", {}),
	-- 	callback = function()
	-- 		require("barbecue.ui").update()
	-- 	end,
	-- })
	-- end,
}
