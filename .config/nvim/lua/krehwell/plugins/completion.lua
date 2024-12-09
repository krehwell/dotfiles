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

		completion = {
			keyword = {
				range = "full",
			},
			accept = { auto_brackets = { enabled = true } },
			list = {
				max_items = 100,
				selection = "auto_insert",
			},
			documentation = {
				auto_show = true,
			},
			menu = {
				enabled = true,
				draw = {
					padding = 1,
					columns = { { "label", "label_description", gap = 1 }, { "kind_icon" } },
				},
			},
		},

		signature = {
			enabled = true,
			trigger = {
				blocked_trigger_characters = {},
				blocked_retrigger_characters = {},
				-- When true, will show the signature help window when the cursor comes after a trigger character when entering insert mode
				show_on_insert_on_trigger_character = true,
			},
		},

		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "normal",
			kind_icons = {
				Text = "[Text]",
				Method = "[Method]",
				Function = "[Function]",
				Constructor = "[Constructor]",

				Field = "[Field]",
				Variable = "[Variable]",
				Property = "[Property]",

				Class = "[Class]",
				Interface = "[Interface]",
				Struct = "[Struct]",
				Module = "[Module]",

				Unit = "[Unit]",
				Value = "[Value]",
				Enum = "[Enum]",
				EnumMember = "[EnumMember]",

				Keyword = "[Keyword]",
				Constant = "[Constant]",

				Snippet = "[Snippet]",
				Color = "[Color]",
				File = "[File]",
				Reference = "[Reference]",
				Folder = "[Folder]",
				Event = "[Event]",
				Operator = "[Operator]",
				TypeParameter = "[TypeParameter]",
			},
		},
	},
}

return blink
