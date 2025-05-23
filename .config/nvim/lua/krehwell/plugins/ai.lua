return {
	"Exafunction/windsurf.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
	},
	enabled = true,
	event = "InsertEnter",
	config = function()
		require("codeium").setup({
			enable_cmp_source = false,
			quite = true,
			detect_proxy = false,
			enable_chat = true,
			virtual_text = {
				quite = true,
				enabled = true,
				idle_delay = 75,
				key_bindings = {
					accept = "<C-l>",
					accept_word = "<M-l>",
					-- accept_line = "<C-L>",
					clear = "<C-c>",
					next = "<M-]>",
					prev = "<M-[>",
				},
			},
			workspace_root = {
				use_lsp = true,
				paths = {
					".bzr",
					".git",
					".hg",
					".svn",
					"_FOSSIL_",
					".gitignore",
					"package.json",
				},
			},
		})

		-- -- this works for kitty terminal
		-- vim.keymap.set("i", "¬", function()
		-- 	return vim.fn["codeium#Accept"]()
		-- end, { expr = true })
		-- vim.keymap.set("i", "‘", function()
		-- 	return vim.fn["codeium#CycleCompletions"](1)
		-- end, { expr = true })
		-- vim.keymap.set("i", "“", function()
		-- 	return vim.fn["codeium#CycleCompletions"](-1)
		-- end, { expr = true })
		-- vim.keymap.set("i", "˙", function()
		-- 	return vim.fn["codeium#Clear"]()
		-- end, { expr = true })
	end,
}
