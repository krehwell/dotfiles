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
		foreground = "#f1f1f1",
		cursor_bg = "#c6c6c6",
		cursor_fg = "#161B1A",
	},

	hide_tab_bar_if_only_one_tab = true,
	-- exit_behavior = "CloseOnCleanExit",
  native_macos_fullscreen_mode = true,

	window_padding = { left = 0, right = 0, top = 0, bottom = 0 },
	window_close_confirmation = "NeverPrompt",

	keys = {
		{
			key = "f",
			mods = "CTRL|CMD",
			action = wezterm.action.ToggleFullScreen,
		},
	},

  cursor_blink_rate = 500,
}

return config