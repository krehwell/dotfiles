return {
	"otavioschwanck/arrow.nvim",
	dependencies = {
		{ "echasnovski/mini.icons" },
	},
	opts = {
		show_icons = true,
		leader_key = "mm",
		buffer_leader_key = "''",
		window = {
			border = "double",
		},
		cache_window = {
			width = 100,
			height = 15,
		},
	},
	keys = {
		{ "mo", ":norm mme<CR>", desc = "arrow.nvim open edit mode" },
		{ "mm", desc = "arrow.nvim open menu (buffers)" },
		{ "''", desc = "arrow.nvim open menu (lines)" },
	},
	config = function(_, opts)
		require("arrow").setup(opts)

		vim.api.nvim_create_autocmd({ "BufEnter", "CursorMoved" }, {
			pattern = "*",
			callback = function()
				if vim.bo.filetype == "" then
                    vim.cmd("setlocal cursorline")
				end
			end,
		})
	end,
}
