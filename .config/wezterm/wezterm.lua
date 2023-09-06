local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on("gui-startup", function()
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():toggle_fullscreen()
end)

-- This table will hold the configuration.
local config = {
  font = wezterm.font_with_fallback({
    -- font weight to be a little bold
    { family = "JetBrains Mono",         weight = "DemiBold" },
    { family = "Symbols Nerd Font Mono", scale = 0.8 },
  }),
  font_size = 9.6,
  line_height = 1.06,
  cell_width = 0.93,

  colors = {
    background = "#1a1a19",
    cursor_bg = "#c678dd",
    cursor_border = "#d4d4d4",
    cursor_fg = "#1e1e1e",
    foreground = "#d4d4d4",
    selection_bg = "#dcdcaa",
    selection_fg = "#1e1e1e",
  },
  ansi = {
    "#1e1e1e",
    "#f44747",
    "#608b4e",
    "#dcdcaa",
    "#569cd6",
    "#c678dd",
    "#56b6c2",
    "#d4d4d4",
  },

  hide_tab_bar_if_only_one_tab = true,
  native_macos_fullscreen_mode = true,
  -- exit_behavior = "CloseOnCleanExit",

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
