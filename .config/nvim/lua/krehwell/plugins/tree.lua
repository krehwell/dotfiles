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

				-- local function find_oil_window()
				-- 	for _, win in ipairs(vim.api.nvim_list_wins()) do
				-- 		local buf = vim.api.nvim_win_get_buf(win)
				-- 		if vim.api.nvim_buf_get_option(buf, "filetype") == "oil" then
				-- 			return win
				-- 		end
				-- 	end
				-- 	return nil
				-- end

				-- local oil_win = find_oil_window()

				-- if oil_win then
				-- 	-- Oil buffer is open
				-- 	if vim.api.nvim_get_current_win() == oil_win then
				-- 		-- Current window is oil, close it
				-- 		vim.cmd("bd")
				-- 	else
				-- 		-- Focus the oil window
				-- 		vim.api.nvim_set_current_win(oil_win)
				-- 	end
				-- else
				-- 	-- Oil buffer is not open, create and open it
				-- 	vim.cmd("vsplit | wincmd H | vertical resize 35")

				oil.open()
				-- end
			end,
			desc = "Toggle file explorer (oil.nvim)",
			silent = true,
		},
	},
}

return oil
