return {
	"Exafunction/codeium.nvim",
	name = "codeium",
	enabled = true,
	event = "InsertEnter",
	config = function()
		require("codeium").setup({
			enable_cmp_source = false,
			-- enterprise_mode = true,
			virtual_text = {
				enabled = true,
				idle_delay = 30,
				key_bindings = {
					accept = "<C-l>",
					accept_word = "<M-l>",
					-- accept_line = "<C-L>",
					clear = "<C-c>",
					next = "<M-]>",
					prev = "<M-[>",
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
