return {
	"alucherdi/hand-of-god",
	keys = {
		{ "mo", ":norm mme<CR>", desc = "arrow.nvim open edit mode" },
		{ "mm", desc = "arrow.nvim open menu (buffers)" },
		{ "ma", desc = "hand-of-god add file" },
		{ "''", desc = "arrow.nvim open menu (lines)" },
	},
	config = function(_, opts)
		local jumper = require("handofgod.jumper")
		jumper.setup()

		-- add file to jumper list
		vim.keymap.set("n", "ma", function()
			jumper.add()
		end)
		-- explore jumper list as buffer
		vim.keymap.set("n", "mo", function()
			jumper:explore()
            vim.cmd("setlocal cursorline")
		end)
	end,
}
