return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		vim.keymap.set("n", "ma", function()
			harpoon:list():append()
		end)
		vim.keymap.set("n", "mo", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		for i = 1, 9 do
			vim.keymap.set("n", "'" .. i, function()
				harpoon:list():select(i)
			end)
		end
	end,
	keys = {
		{ "ma", desc = "Harpoon add file" },
		{ "mo", desc = "Harpoon toggle menu" },
	},
}
