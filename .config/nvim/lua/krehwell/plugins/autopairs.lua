return {
	"echasnovski/mini.pairs",
	dependencies = {
		{ "windwp/nvim-ts-autotag" },
	},
	-- enabled = false,
	event = "InsertEnter",
	config = function()
		require("mini.pairs").setup({
			modes = { insert = true, command = false, terminal = false },
		})
		require("nvim-ts-autotag").setup({
			opts = {
				enable_close = true,
				enable_rename = true,
				enable_close_on_slash = false,
			},
		})
	end,
}

-- return {
-- 	"saghen/blink.pairs",
-- 	version = "*",
-- 	dependencies = "saghen/blink.download",

-- 	--- @module 'blink.pairs'
-- 	--- @type blink.pairs.Config
-- 	opts = {
-- 		mappings = {
-- 			enabled = true,
-- 			cmdline = false,
-- 			disabled_filetypes = {},
-- 			pairs = {},
-- 		},
-- 		highlights = {
-- 			enabled = false,
-- 		},
-- 	},
-- }
