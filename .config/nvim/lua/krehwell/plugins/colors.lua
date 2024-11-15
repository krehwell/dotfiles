-- vim.cmd("syntax off")
-- vim.opt.termguicolors = true
-- vim.opt.background = "dark"

return {
	"krehwell/colors",
	dev = true,
	dependencies = {
		{ "RRethy/base16-nvim" },
	},

	config = function()
		require("base16-colorscheme").setup({
			base00 = "#151515",
			base01 = "#202020",
			base02 = "#303030",
			base03 = "#505050",
			base04 = "#b0b0b0",
			base05 = "#d0d0d0",
			base06 = "#e0e0e0",
			base07 = "#f5f5f5",
			base08 = "#fb9fb1",
			base09 = "#eda987",
			base0A = "#ddb26e",
			base0B = "#acc267",
			base0C = "#15cfc0",
			base0D = "#6fc2ef",
			base0E = "#e1a3ee",
			base0F = "#deaf8e",
		}, {
			lsp_semantic = false,
			telescope = false,
			indentblankline = false,
			notify = false,
			ts_rainbow = false,
			cmp = true,
			illuminate = false,
			dapui = false,
		})

		vim.cmd([[ let &statusline='%#WinSeparator#' ]]) -- color the split window dashes
	end,
}
