return {
	"utilyre/barbecue.nvim",
	name = "barbecue",
	version = "*",
	dependencies = {
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons", -- optional dependency
	},
	ft = require("krehwell.lsp-utils").fts,
	opts = {
		attach_navic = false,
		show_dirname = true,
		show_modified = false,
		modifiers = { dirname = ":h:t", basename = "" },
		theme = {
			-- normal = { bg = "#262626", --[[ fg = "#c6c6c6" ]] },
		},
		symbols = { modified = "+", ellipsis = "…", separator = "" },
		exclude_filetypes = { "netrw", "toggleterm", "fern", "fern-replacer", "fzf", "Trouble", "minifiles" },
		create_autocmd = false,
		lead_custom_section = function()
			return ""
		end,
	},
	config = function(_, opts)
		-- triggers CursorHold event faster
		-- vim.opt.updatetime = 200

		require("barbecue").setup(opts)

		vim.api.nvim_create_autocmd({
			-- "WinScrolled",
			-- "CursorHold",
			-- "BufModifiedSet",
			"BufWinEnter",
			-- "InsertLeave",
		}, {
			group = vim.api.nvim_create_augroup("barbecue.updater", {}),
			callback = function()
				require("barbecue.ui").update()
			end,
		})
	end,
}
