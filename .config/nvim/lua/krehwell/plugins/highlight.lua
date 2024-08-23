return {
	"echasnovski/mini.hipatterns",
	version = false,
	event = "BufReadPre",
	opts = function()
		local hi = require("mini.hipatterns")
		return {
			-- custom LazyVim option to enable the tailwind integration
			tailwind = {
				enabled = false,
				ft = { "typescriptreact", "javascriptreact", "css", "javascript", "typescript", "html" },
				-- full: the whole css class will be highlighted
				-- compact: only the color will be highlighted
				style = "full",
			},
			highlighters = {
				hex_color = hi.gen_highlighter.hex_color({ priority = 2000 }),
				shorthand = {
					pattern = "()#%x%x%x()%f[^%x%w]",
					group = function(_, _, data)
						---@type string
						local match = data.full_match
						local r, g, b = match:sub(2, 2), match:sub(3, 3), match:sub(4, 4)
						local hex_color = "#" .. r .. r .. g .. g .. b .. b

						return MiniHipatterns.compute_hex_color_group(hex_color, "bg")
					end,
					extmark_opts = { priority = 2000 },
				},
			},
		}
	end,
}
