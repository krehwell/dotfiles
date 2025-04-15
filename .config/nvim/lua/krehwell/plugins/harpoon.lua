return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup({
			settings = {
				save_on_toggle = true,
			},
			ui = {
				width = 120, -- Increase the width
				height = 80, -- Increase the height
			},
		})
		vim.keymap.set("n", "ma", function()
			print("harpoon:add() - " .. vim.fn.expand("%:.:p"))
			harpoon:list():add()
		end)
		vim.keymap.set("n", "mo", function()
			harpoon.ui:toggle_quick_menu(harpoon:list(), {
				height_in_lines = 15,
			})
		end)

		for i = 1, 9 do
			vim.keymap.set("n", "'" .. i, function()
				harpoon:list():select(i)
			end)
		end

		-- harpoon:extend(harpoon_extensions.builtins.highlight_current_file())

		vim.cmd([[
          augroup harpoon_cursorline
            au!
            au FileType harpoon setlocal cursorline
          augroup END
        ]])
	end,

	keys = {
		{ "ma", desc = "Harpoon add file" },
		{ "mo", desc = "Harpoon toggle menu" },
	},
}
