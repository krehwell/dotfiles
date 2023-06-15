local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {
	font = wezterm.font_with_fallback({
		-- font weight to be a little bold
		{ family = "Consolas", weight = "Medium" },
		{ family = "Symbols Nerd Font Mono", scale = 0.7 },
	}),
	font_size = 14,

	colors = {
		background = "#161B1A",
		foreground = "#B8BBBB", -- #B8BBBB, #A1AFA1, #F1F1F1, #A1AFAF, #BBB8BB
		cursor_bg = "#c6c6c6",
		cursor_fg = "#161B1A",
	},

	hide_tab_bar_if_only_one_tab = true,
	-- exit_behavior = "CloseOnCleanExit",
	native_macos_fullscreen_mode = true,

	window_padding = { left = 0, right = 0, top = 0, bottom = 0 },
	window_close_confirmation = "NeverPrompt",
	initial_rows = 40,
	initial_cols = 110,

	keys = {
		{
			key = "f",
			mods = "CTRL|CMD",
			action = wezterm.action.ToggleFullScreen,
		},
		-- disable CTRL + SHIFT + P
		{
			key = "P",
			mods = "CTRL|SHIFT",
			action = "DisableDefaultAssignment",
		},
	},

	cursor_blink_rate = 500,
}

return config
