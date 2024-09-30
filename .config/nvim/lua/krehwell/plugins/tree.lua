local minifiles = {
	"echasnovski/mini.files",
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
			go_in = "<C-l>",
			go_in_plus = "<CR>",
			go_out = "<C-h>",
			go_out_plus = "H",
			reset = "<BS>",
			reveal_cwd = "@",
			show_help = "g?",
			synchronize = "=",
			trim_left = "<",
			trim_right = ">",
		},

		-- General options
		options = {
			permanent_delete = false,
			use_as_default_explorer = true,
		},

		windows = {
			max_number = math.huge, -- Maximum number of windows to show side by side
			preview = false, -- Whether to show preview of file/directory under cursor
			width_focus = 55,
			width_nofocus = 35,
			width_preview = 25,
		},
	},

	config = function(_, opts)
		require("mini.files").setup(opts)
	end,
}

local oil = {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
		lsp_file_methods = {
			enabled = true,
			timeout_ms = 10000,
		},

		watch_for_changes = true,

		view_options = {
			show_hidden = true,
		},

		float = {
			max_width = 70,
			max_height = 30,
			border = "rounded",
		},

		delete_to_trash = true,

		keymaps = {
			["<C-h>"] = { "actions.parent" },
			["<C-l>"] = { "actions.select" },
		},

		skip_confirm_for_simple_edits = true,
		prompt_save_on_select_new_entry = false,
	},
	dependencies = {
		{ "echasnovski/mini.icons", opts = {} },
		{
			"antosha417/nvim-lsp-file-operations",
			config = function()
				require("lsp-file-operations").setup()
			end,
		},
	},
	keys = {
		{
			"<C-b>",
			function()
				local oil = require("oil")
				oil.open()
			end,
			desc = "Toggle file explorer (oil.nvim)",
			silent = true,
		},
	},
}

return oil
