return {
	"L3MON4D3/LuaSnip",
	dependencies = { "rafamadriz/friendly-snippets" },
	version = "v2.*",
	build = "make install_jsregexp",
	event = "InsertEnter",
	config = function()
		require("luasnip.loaders.from_vscode").lazy_load()

		local ls = require("luasnip")

		local expand_or_jump = function()
			if ls.expand_or_jumpable() then
				ls.expand_or_jump()
			end
		end

		-- local jump_next = function()
		-- 	if ls.jumpable(1) then
		-- 		ls.jump(1)
		-- 	end
		-- end

		local jump_prev = function()
			if ls.jumpable(-1) then
				ls.jump(-1)
			end
		end

		local change_choice = function()
			if ls.choice_active() then
				ls.change_choice(1)
			end
		end

		vim.keymap.set({ "i", "s" }, "<c-l>", expand_or_jump)
		vim.keymap.set({ "i", "s" }, "<c-h>", jump_prev)
		vim.keymap.set({ "i", "s" }, "<c-r>", change_choice)
	end,
}
