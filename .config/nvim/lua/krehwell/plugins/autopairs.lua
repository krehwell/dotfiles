return {
	"echasnovski/mini.pairs",
	enabled = true,
	version = false,
	event = "InsertEnter",
	config = function()
		require("mini.pairs").setup({})
	end,
}
