return {
	"echasnovski/mini.pairs",
	dependencies = {
		{ "windwp/nvim-ts-autotag" },
	},
	-- enabled = false,
	event = "InsertEnter",
	opts = {
		modes = { insert = true, command = false, terminal = false },
		-- skip autopair when next character is one of these
		skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
		-- skip autopair when next character is closing pair
		-- and there are more closing pairs than opening pairs
		skip_unbalanced = true,
	},
	config = function(_, opts)
		require("nvim-ts-autotag").setup({
			opts = {
				enable_close = true,
				enable_rename = true,
				enable_close_on_slash = false,
			},
		})

		local pairs = require("mini.pairs")
		pairs.setup(opts)
		local open = pairs.open
		pairs.open = function(pair, neigh_pattern)
			local o, c = pair:sub(1, 1), pair:sub(2, 2)
			local line = vim.api.nvim_get_current_line()
			local cursor = vim.api.nvim_win_get_cursor(0)
			local next = line:sub(cursor[2] + 1, cursor[2] + 1)
			local before = line:sub(1, cursor[2])
			if opts.markdown and o == "`" and vim.bo.filetype == "markdown" and before:match("^%s*``") then
				return "`\n```" .. vim.api.nvim_replace_termcodes("<up>", true, true, true)
			end
			if opts.skip_next and next ~= "" and next:match(opts.skip_next) then
				return o
			end
			if opts.skip_unbalanced and next == c and c ~= o then
				local _, count_open = line:gsub(vim.pesc(pair:sub(1, 1)), "")
				local _, count_close = line:gsub(vim.pesc(pair:sub(2, 2)), "")
				if count_close > count_open then
					return o
				end
			end
			return open(pair, neigh_pattern)
		end
	end,
}
