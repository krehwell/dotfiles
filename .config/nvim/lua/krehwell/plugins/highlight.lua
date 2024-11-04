return {
	"echasnovski/mini.hipatterns",
	version = false,
	event = "BufReadPre",
	opts = function()
		local hi = require("mini.hipatterns")
		return {
			tailwind = {
				enabled = true,
				ft = { "typescriptreact", "javascriptreact", "css", "javascript", "typescript", "html" },
				-- full: the whole css class will be highlighted
				-- compact: only the color will be highlighted
				style = "full",
			},
			highlighters = {
				hex_color = hi.gen_highlighter.hex_color(),
			},
		}
	end,
}
