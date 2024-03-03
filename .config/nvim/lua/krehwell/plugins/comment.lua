return {
	"echasnovski/mini.comment",
	version = false,
	dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
	event = "InsertEnter",
	config = function()
		require("mini.comment").setup({
			ignore_blank_line = true,
		})
	end,
}
