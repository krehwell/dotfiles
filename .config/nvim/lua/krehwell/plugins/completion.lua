local blink = {
	"saghen/blink.cmp",
	event = "BufReadPre",
	version = "v0.*",
	dependencies = "rafamadriz/friendly-snippets",
	opts = {
		keymap = {
			preset = "enter",
		},

		sources = {
			completion = {
				enabled_providers = { "lsp", "path", "snippets", "buffer", "lazydev" },
			},
			providers = {
				-- dont show LuaLS require statements when lazydev has items
				lsp = { fallback_for = { "lazydev" } },
				lazydev = { name = "LazyDev", module = "lazydev.integrations.blink" },
			},
		},

		windows = {
			autocomplete = {
				selection = "auto_insert",
				draw = "reversed",
			},
			documentation = {
				auto_show = true,
			},
		},

		trigger = {
			signature_help = {
				enabled = true,
				show_on_insert_on_trigger_character = true,
			},
		},

		accept = { auto_brackets = { enabled = true } },

		lsp = {
			max_items = 50, -- maximum number of items to return
		},

		highlight = {
			use_nvim_cmp_as_default = true,
		},
	},
}

return blink
