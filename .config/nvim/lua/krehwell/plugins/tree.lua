function _G.get_oil_winbar()
	local dir = require("oil").get_current_dir()
	if dir then
		local root = vim.fn.getcwd()
		local relative_path = vim.fn.fnamemodify(dir, ":p"):sub(#root + 2)

		if relative_path == "" then
			return vim.fn.fnamemodify(root, ":~")
		else
			return relative_path
		end
	else
		-- If there is no current directory (e.g. over ssh), just show the buffer name
		return vim.api.nvim_buf_get_name(0)
	end
end

return {
	"stevearc/oil.nvim",
	ft = { "oil" },
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
			["<C-c>"] = false,
			["<C-p>"] = false,
		},

		skip_confirm_for_simple_edits = true,
		prompt_save_on_select_new_entry = false,
		win_options = {
			winbar = "%!v:lua.get_oil_winbar()",
		},
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
