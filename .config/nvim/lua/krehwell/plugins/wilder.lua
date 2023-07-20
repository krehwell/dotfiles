function ToggleWilder(enable)
	if
		vim.bo.filetype == "fern"
		or vim.bo.filetype == "lazy"
		or vim.bo.filetype == "mason"
		or vim.bo.filetype == "help"
	then
		pcall(function()
			if enable then
				vim.cmd("call wilder#enable()")
			else
				vim.cmd("call wilder#disable()")
			end
		end)
	end
end

return {
	"gelguy/wilder.nvim",
	enabled = true,
	build = ":UpdateRemotePlugins",
	ft = { "fern", "mason", "lazy" },
	keys = {
		{ "/", desc = "Find next with wilder.nvim" },
		{ "?", desc = "Find previous with wilder.nvim" },
	},
	init = function()
		vim.api.nvim_exec(
			[[
        " I don't want wilder on 'fern', 'mason', and 'lazy' popup due to the highlight is bad
        augroup custom-wilder-behavior
          autocmd! *
          autocmd BufEnter,WinEnter * lua ToggleWilder(false)
          autocmd BufLeave,WinLeave * lua ToggleWilder(true)
        augroup END
      ]],
			false
		)
	end,
	config = function()
		local wilder = require("wilder")

		wilder.set_option("pipeline", {
			wilder.branch(
				wilder.cmdline_pipeline({
					language = "python",
					-- 0 turns off fuzzy matching
					-- 1 turns on fuzzy matching
					-- 2 partial fuzzy matching (match does not have to begin with the same first letter)
					fuzzy = 1,
				}),
				wilder.python_search_pipeline({
					pattern = wilder.python_fuzzy_pattern(),
					sorter = wilder.python_difflib_sorter(),
					-- can be set to 're2' for performance, requires pyre2 to be installed
					-- see :h wilder#python_search() for more details
					engine = "re",
				})
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
