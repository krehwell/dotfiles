local present, wilder = pcall(require, "wilder")
if not present then
	return
end

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
			separator = " ",
			highlighter = wilder.basic_highlighter(),
		}),
	})
)
wilder.setup({
	modes = { ":", "/", "?" },
	enable_cmdline_enter = 0,
})
