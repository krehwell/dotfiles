return {
	"saghen/blink.pairs",
	version = "*",
	dependencies = "saghen/blink.download",

	--- @module 'blink.pairs'
	--- @type blink.pairs.Config
	opts = {
		mappings = {
			enabled = true,
			cmdline = false,
			disabled_filetypes = {},
			pairs = {},
		},
		highlights = {
			enabled = true,
		},
	},
}
