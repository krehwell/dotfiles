local minifiles = {
	"echasnovski/mini.files",
	dependencies = {
		"antosha417/nvim-lsp-file-operations",
	},
	keys = {
		{
			"<C-b>",
			function()
				local minifiles = require("mini.files")
				local current_filetype = vim.bo.filetype
				if current_filetype == "minifiles" then
					minifiles.close()
				else
					minifiles.open(vim.api.nvim_buf_get_name(0), true)
				end
			end,
			desc = "Open file explorer (mini.files)",
			silent = true,
		},
	},
	opts = {
		-- Use `''` (empty string) to not create one.
		mappings = {
			close = "<c-[>",
		},

		-- General options
		options = {
			permanent_delete = false,
			use_as_default_explorer = true,
		},

		windows = {
			max_number = math.huge, -- Maximum number of windows to show side by side
			preview = false, -- Whether to show preview of file/directory under cursor
			width_focus = 50,
			width_nofocus = 35,
			width_preview = 25,
		},
	},

	config = function(_, opts)
		require("mini.files").setup(opts)
		require("lsp-file-operations").setup()
	end,
}

return minifiles
