return {
	"altermo/ultimate-autopair.nvim",
	dependencies = {
		-- {
		-- 	"windwp/nvim-autopairs",
		-- 	event = "InsertEnter",
		-- 	opts = {
		-- 		map_c_w = true,
		-- 		-- enable_check_bracket_line = false,
		-- 	},
		-- },
	},
	event = { "InsertEnter" },
	branch = "v0.6",
	opts = {
		cmap = false,
		pair_cmap = false,
	},
}
