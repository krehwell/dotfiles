local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {
	font = wezterm.font_with_fallback({
		-- font weight to be a little bold
		{ family = "SF Mono", weight = "DemiBold" },
		{ family = "Symbols Nerd Font Mono", scale = 0.8 },
	}),
	font_size = 10.55,

	colors = {
		background = "#1e1e1f", -- #262626 #0F1419
		foreground = "#fffffe", -- #B8BBBB, #A1AFA1, #F1F1F1, #A1AFAF, #BBB8BB #C6C6C6 #86B300
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
		-- disable CTRL+SHIFT+P since it's being used by vim
		{
			key = "P",
			mods = "CTRL|SHIFT",
			action = "DisableDefaultAssignment",
		},
		{
			key = "p",
			mods = "CMD",
			action = wezterm.action({ SendString = "~/utils/tmux-sessionizer\n" }),
		},
	},

	cursor_blink_rate = 500,
}

return config
