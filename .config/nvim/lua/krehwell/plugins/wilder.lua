return {
	"gelguy/wilder.nvim",
	dependencies = "romgrk/fzy-lua-native",
	enabled = true,
	keys = {
		{ "/", desc = "Find next with wilder.nvim" },
		{ "?", desc = "Find previous with wilder.nvim" },
	},
	config = function()
		local wilder = require("wilder")

		wilder.set_option("pipeline", {
			wilder.branch(
				wilder.cmdline_pipeline({
					fuzzy = 2,
					fuzzy_filter = wilder.lua_fzy_filter(),
				}),
				wilder.vim_search_pipeline()
			),
		})

		wilder.set_option(
			"renderer",
			wilder.renderer_mux({
				[":"] = wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
					highlights = {
						border = "Normal", -- highlight to use for the border
					},
					border = "rounded",
				})),
				["/"] = wilder.wildmenu_renderer({
					highlighter = wilder.basic_highlighter(),
					right = { " ", wilder.wildmenu_index() },
				}),
				["?"] = wilder.wildmenu_renderer({
					highlighter = wilder.basic_highlighter(),
					right = { " ", wilder.wildmenu_index() },
					-- left = { " ", wilder.wildmenu_spinner(), " " },
				}),
			})
		)

		wilder.setup({
			modes = { --[[ ":", ]]
				"/",
				"?",
			},
			-- enable_cmdline_enter = 0,
		})
	end,
}
