return {
	"gelguy/wilder.nvim",
	dependencies = { "roxma/nvim-yarp", "roxma/vim-hug-neovim-rpc" },
	enabled = false,
	keys = {
		{ "/" },
	},
	config = function()
		local wilder = require("wilder")

		-- wilder.set_option("pipeline", {
		-- 	wilder.branch(
		-- 		wilder.cmdline_pipeline({
		-- 			language = "python",
		-- 			fuzzy = 2, -- 2 partial fuzzy matching (match does not have to begin with the same first letter)
		-- 		}),
		-- 		wilder.python_search_pipeline({
		-- 			-- can be set to wilder#python_fuzzy_delimiter_pattern() for stricter fuzzy matching
		-- 			pattern = wilder.python_fuzzy_pattern(),
		-- 			-- omit to get results in the order they appear in the buffer
		-- 			sorter = wilder.python_difflib_sorter(),
		-- 			engine = "re",
		-- 		})
		-- 	),
		-- })

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
