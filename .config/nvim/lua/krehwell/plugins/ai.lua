return {
	"Exafunction/windsurf.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
	},
	enabled = false,
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
				-- idle_delay = 75,
				key_bindings = {
					accept = "<Tab>",
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
	end,
}
