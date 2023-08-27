return {
	"monaqa/dial.nvim",
	lazy = true,
	module = true,
	keys = function()
		local dial = require("dial.map")
		return {
			{ "<C-a>", dial.inc_normal(), desc = "Increment" },
			{ "<C-x>", dial.dec_normal(), desc = "Decrement" },
			{ "g<C-a>", dial.inc_gnormal() },
			{ "f<C-x>", dial.dec_gnormal() },
			{ "<C-a>", dial.inc_visual(), mode = "v" },
			{ "<C-x>", dial.dec_visual(), mode = "v" },
		}
	end,
	init = function()
		local augend = require("dial.augend")
		require("dial.config").augends:register_group({
			default = {
				augend.integer.alias.hex, -- nonnegative hex number  (0x01, 0x1a24, etc.)
				augend.constant.alias.bool, -- boolean value (true <-> false)
				augend.date.alias["%d/%m/%y"], -- date (02/12/2022, etc.)
				augend.date.alias["%m/%d/%y"], -- date (07/19/2023, etc.)
				augend.constant.new({
					elements = { "&&", "||" },
					word = false,
					cyclic = true,
				}),
				augend.constant.alias.alpha,
				augend.constant.alias.alpha,
			},
		})
	end,
}
