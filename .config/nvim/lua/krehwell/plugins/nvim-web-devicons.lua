return {
	"nvim-tree/nvim-web-devicons",
	event = "VeryLazy",
	lazy = true,
	opts = {
		override = {
			zsh = {
				icon = "",
				color = "#428850",
				cterm_color = "65",
				name = "Zsh",
			},
		},
		color_icons = true,
		default = true,
	},
}
