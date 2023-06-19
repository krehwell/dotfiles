return {
	"ibhagwan/fzf-lua",
	dependencies = {
		{ "junegunn/fzf", build = "./install --bin" },
	},
	config = function()
		require("fzf-lua").setup({
			"telescope",
			winopts = {
				preview = {
					scrollbar = "border",
				},
			},
			grep = {
				rg_glob = true,
				winopts = {
					-- split         = "belowright new",-- open in a split instead?
					-- "belowright new"  : split below
					-- "aboveleft new"   : split above
					-- "belowright vnew" : split right
					-- "aboveleft vnew   : split left
					height = 0.95, -- window height
					width = 0.95, -- window width
				},
			},
		})
	end,
	keys = {
		{ "<C-f>", ":lua require('fzf-lua').grep({})<CR><CR>", desc = "fuzzy search" },
	},
	cmd = { "FzfLua" },
}
