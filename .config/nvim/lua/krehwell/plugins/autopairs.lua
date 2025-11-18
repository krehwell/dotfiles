return {
	"echasnovski/mini.pairs",
	dependencies = {
		{ "windwp/nvim-ts-autotag" },
	},
	version = false,
	event = "InsertEnter",
	config = function()
		require("mini.pairs").setup({
			modes = { insert = true, command = false, terminal = false },
		})
		require("nvim-ts-autotag").setup({
			opts = {
				enable_close = true,
				enable_rename = true,
				enable_close_on_slash = false,
			},
		})
	end,
}
