return {
	"windwp/nvim-ts-autotag", -- html auto tag
	event = "BufReadPre",
	config = function()
		-- for autotag to work properly for jsx file
		-- ~/.local/share/nvim/lazy/nvim-ts-autotag/lua/nvim-ts-autotag/internal.lua:570
		-- set `{ clear = false }`
		-- if want to update this plugin, set it back to true and update then reset it back to false
		require("nvim-ts-autotag").setup({
			opts = {
				enable_close = true,
				enable_rename = true,
				enable_close_on_slash = false,
			},
		})
	end,
}
