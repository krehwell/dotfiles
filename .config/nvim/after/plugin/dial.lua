local present, dial = pcall(require, "dial.map")
if not present then
	return
end

local augend = require("dial.augend")
require("dial.config").augends:register_group({
	-- default augends used when no group name is specified
	default = {
		augend.integer.alias.decimal, -- nonnegative decimal number (0, 1, 2, 3, ...)
		augend.integer.alias.hex, -- nonnegative hex number  (0x01, 0x1a24, etc.)
		augend.constant.alias.bool, -- boolean value (true <-> false)
		augend.date.alias["%d/%m/%Y"], -- date (02/12/2022, etc.)
		augend.date.alias["%m/%d/%Y"], -- date (07/19/2023, etc.)
		augend.constant.new({
			elements = { "&&", "||" },
			word = false,
			cyclic = true,
		}),
		augend.constant.alias.Alpha,
		augend.constant.alias.alpha,
	},
})

vim.keymap.set("n", "<C-a>", dial.inc_normal(), { noremap = true })
vim.keymap.set("n", "<C-x>", dial.dec_normal(), { noremap = true })
vim.keymap.set("n", "g<C-a>", dial.inc_gnormal(), { noremap = true })
vim.keymap.set("n", "g<C-x>", dial.dec_gnormal(), { noremap = true })
vim.keymap.set("v", "<C-a>", dial.inc_visual(), { noremap = true })
vim.keymap.set("v", "<C-x>", dial.dec_visual(), { noremap = true })
vim.keymap.set("v", "g<C-a>", dial.inc_gvisual(), { noremap = true })
vim.keymap.set("v", "g<C-x>", dial.dec_gvisual(), { noremap = true })
