return {
	"numToStr/Comment.nvim",
	dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
	opts = function()
		local tscontext = require("ts_context_commentstring.integrations.comment_nvim")
		return {
			padding = true, -- Add a space b/w comment and the line
			sticky = true, -- Whether the cursor should stay at its position
			ignore = nil, -- Lines to be ignored while (un)comment
			-- LHS of toggle mappings in NORMAL mode
			toggler = {
				line = "gcc", -- Line-comment toggle keymap
				block = "gbc", -- Block-comment toggle keymap
			},
			-- LHS of operator-pending mappings in NORMAL and VISUAL mode
			opleader = {
				line = "gc", -- Line-comment keymap
				block = "gb", -- Block-comment keymap
			},
			-- LHS of extra mappings
			extra = {
				above = "gcO", -- Add comment on the line above
				below = "gco", -- Add comment on the line below
				eol = "gcA", -- Add comment at the end of line
			},
			-- Enable keybindings
			-- NOTE: If given `false` then the plugin won't create any mappings
			mappings = {
				basic = true, -- Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
				extra = true, -- Extra mapping; `gco`, `gcO`, `gcA`
			},
			-- Function to call before (un)comment
			pre_hook = tscontext.create_pre_hook(),
			-- Function to call after (un)comment
			post_hook = nil,
		}
	end,
	keys = {
		{ "gcc", mode = "n", desc = "Comment current line" },
		{ "gbc", mode = "n", desc = "Comment block current line" },
		{ "gco", mode = "n", desc = "Append comment below current line" },
		{ "gcO", mode = "n", desc = "Append comment above current line" },
		{ "gc", mode = { "n", "v" }, desc = "Comment selection" },
		{ "gb", mode = { "n", "v" }, desc = "Block comment selection" },
	},
}