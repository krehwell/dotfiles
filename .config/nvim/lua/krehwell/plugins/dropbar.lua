return {
	"Bekaboo/dropbar.nvim",
	dependencies = {
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
	ft = require("krehwell.lsp-utils").fts,
	opts = {
		icons = {
			kinds = {
				symbols = {
					File = " ",
				},
			},
		},
		menu = {
			keymaps = {
				-- close menu without reverting the win position
				["<CR>"] = function()
					local utils = require("dropbar.utils")
					local menu = utils.menu.get_current()
					local cursor = vim.api.nvim_win_get_cursor(menu.win)
					local component = menu.entries[cursor[1]]:first_clickable(cursor[1])
					if component then
						menu:click_on(component, nil, 1, "l")
					end
				end,
				["<C-h>"] = "<C-w>q",
				["<C-l>"] = function()
					local utils = require("dropbar.utils")
					local menu = utils.menu.get_current()
					if not menu then
						return
					end
					local cursor = vim.api.nvim_win_get_cursor(menu.win)
					local component = menu.entries[cursor[1]]:first_clickable(cursor[2])
					if component then
						menu:click_on(component, nil, 1, "l")
					end
				end,
			},
		},
	},
	config = function(_, opts)
		local dropbar_api = require("dropbar.api")
		vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
		vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
		vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })
		vim.ui.select = require("dropbar.utils.menu").select
	end,
}
