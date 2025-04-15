return {
	"Exafunction/windsurf.nvim",
	name = "codeium",
	enabled = true,
	event = "InsertEnter",
	config = function()
		require("codeium").setup({
			enable_cmp_source = false,
			quite = true,
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
				find_root = nil,
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

-- return {
-- 	"milanglacier/minuet-ai.nvim",
-- 	config = function()
-- 		require("minuet").setup({
-- 			provider = "gemini",
-- 			provider_options = {
-- 				gemini = {
-- 					model = "gemini-2.0-flash",
-- 					stream = true,
-- 					api_key = "GEMINI_API_KEY",
-- 				},
-- 				optional = {
-- 					generationConfig = {
-- 						maxOutputTokens = 512,
-- 					},
-- 				},
-- 			},
-- 			cmp = { enable_auto_complete = false },
-- 			blink = { enable_auto_complete = false },
-- 			virtualtext = {
-- 				auto_trigger_ft = { "lua", "typescript", "typescriptreact" },
-- 				keymap = {
-- 					-- accept whole completion
-- 					accept = "<C-l>",
-- 					-- accept one line
-- 					accept_line = "<M-l>",
-- 					-- accept n lines (prompts for number)
-- 					-- e.g. "A-z 2 CR" will accept 2 lines
-- 					-- accept_n_lines = "<A-z>",
-- 					-- Cycle to prev completion item, or manually invoke completion
-- 					prev = "<A-[>",
-- 					-- Cycle to next completion item, or manually invoke completion
-- 					next = "<A-]>",
-- 					dismiss = "<C-c>",
-- 				},
-- 			},
-- 		})
-- 	end,
-- }
