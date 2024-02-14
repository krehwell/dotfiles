return {
	"kensyo/nvim-scrlbkun",
	event = { "CursorMoved" },
	opts = {
		-- If you want to display scrollbars on multiple windows, set to false.
		-- If set to true, a display area comes out only on the current window.
		single_window = true,

		-- zindex of display areas.
		zindex = 10,

		-- winblend of display areas.
		winblend = 20,

		-- On these filetypes, scrollbars don't come out.
		excluded_filetypes = { "NvimTree", "fern", "mason", "lspinfo", "minifiles" },

		-- On these buftypes, scrollbars don't come out.
		excluded_buftypes = { "prompt" },

		-- Time until a display area is hidden. Specify in milliseconds.
		-- If set to 0, a display area isn't hidden over time.
		fadeout_time = 0,

		-- The number of columns for display areas of components
		width = 2,

		bar = { enable = false },

		-- cursor component
		cursor = {
			-- The same as those of the bar component
			enable = true,
			draw_events = { "BufEnter", "FocusGained", "CursorMoved" },
			draw_events_tab = { "VimResized", "TabEnter" },
			priority = 500,
			draw_columns = { 1 },

			-- Signs for a cursor. Specify in array. If you specify an array of n-elements,
			-- then the sign to be used is determined in n more levels depending on the
			-- cursor position.
			signs = {
				"▔",
				"━",
				"▁",
			},

			-- How to determine the sign to be used. "skip_first" or "normal"
			sign_arrangement = "normal",
		},

		-- search component
		search = {
			-- The same as those of the bar component
			enable = true,
			draw_events = {},
			draw_events_tab = {
				"TextChanged",
				"TextChangedI",
				"TextChangedP",
				"TabEnter",
				{
					"CmdlineLeave",
					{ "/", "\\?", ":" },
				},
				{
					"CmdlineChanged",
					{ "/", "\\?" },
				},
			},
			priority = 500,
			draw_columns = { 1 },

			-- Signs for search results.
			-- If you specify an array of n-elements,
			-- then the sign to be used is determined in n more levels depending
			-- on the number of matched terms
			signs = {
				".",
				":",
			},

			-- If set to true, the 'signs' field is ignored and the plugin uses
			-- symbols and an algorithm that allow for just a little more detailed
			-- drawing.
			use_built_in_signs = false,
		},

		-- diagnostics component
		diagnostics = {
			-- The same as those of the bar component
			enable = true,
			draw_events = {},
			draw_events_tab = { "BufEnter", "DiagnosticChanged", "TabEnter" },
			priority = 400,
			draw_columns = { 1 },

			-- Signs for diagnostics.

			signs = {
				-- If you specify an array of n-elements,
				-- then the sign to be used is determined in n more levels depending
				-- on the number of errors {warns, infos, hints}.
				ERROR = { ".", ":" },
				WARN = { ".", ":" },
				INFO = { ".", ":" },
				HINT = { ".", ":" },
			},

			-- The same as that of the search component
			use_built_in_signs = false,
		},

		-- githunks component
		githunks = {
			enable = true,
			draw_events = {},
			draw_events_tab = {
				{ "User", "GitSignsUpdate" },
			},
			priority = 300,
			draw_columns = { 2 },
			signs = {
				add = { "┃" },
				delete = { "▸" },
				change = { "┇" },
			},
			use_built_in_signs = false,
		},
	},
}
