return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@module 'snacks'
	---@type snacks.Config
	opts = {
		explorer = { enabled = false },
		indent = { enabled = false },
		input = { enabled = false },
		scroll = { enabled = false },
		scope = { enabled = false },
		statuscolumn = { enabled = false },
		picker = { enabled = false },
		bigfile = { enabled = true },
		dashboard = {
			enabled = true,
			preset = { pick = "fzf-lua" },
			width = 80,
			sections = {
				{
					section = "terminal",
					cmd = "fortune -s | cowsay",
					hl = "header",
					padding = 1,
					indent = 8,
					height = 12,
				},
				{ title = "MRU ", file = vim.fn.fnamemodify(".", ":~"), padding = 1 },
				{ section = "recent_files", cwd = true, limit = 8, padding = 1 },
				{ title = "MRU", padding = 1 },
				{ section = "recent_files", limit = 8, padding = 1 },
				{ title = "Sessions", padding = 1 },
				{ section = "projects", padding = 1 },
				{
					pane = 2,
					icon = " ",
					desc = "Browse Repo",
					padding = 1,
					key = "b",
					action = function()
						Snacks.gitbrowse()
					end,
				},
				function()
					local in_git = Snacks.git.get_root() ~= nil
					local cmds = {
						{
							icon = " ",
							title = "Open PRs",
							cmd = "gh pr list -L 10",
							key = "P",
							action = function()
								vim.fn.jobstart("gh pr list --web", { detach = true })
							end,
							height = 10,
						},
						{
							icon = " ",
							title = "Git Status",
							cmd = "git --no-pager diff --stat -B -M -C",
							height = 10,
						},
					}
					return vim.tbl_map(function(cmd)
						return vim.tbl_extend("force", {
							pane = 2,
							section = "terminal",
							enabled = in_git,
							padding = 1,
							ttl = 5 * 60,
							indent = 3,
						}, cmd)
					end, cmds)
				end,
			},
		},
		notifier = { enabled = true, timeout = 3000 },
		quickfile = { enabled = true },
		words = { enabled = true, debounce = 50 },
		styles = {
			notification = {
				-- wo = { wrap = true } -- Wrap notifications
			},
		},
	},
	keys = {
		{
			"<leader><space>",
			function()
				Snacks.picker.smart()
			end,
			desc = "Smart Find Files",
		},
		{
			"<leader>n",
			function()
				Snacks.picker.notifications()
			end,
			desc = "Notification History",
		},
		-- Other
		{
			"<leader>z",
			function()
				Snacks.zen({ win = { backdrop = { transparent = false } } })
			end,
			desc = "Toggle Zen Mode",
		},
		{
			"<leader>.",
			function()
				Snacks.scratch()
			end,
			desc = "Toggle Scratch Buffer",
		},
		{
			"<leader>,",
			function()
				Snacks.scratch.select()
			end,
			desc = "Select Scratch Buffer",
		},
		-- {
		-- 	"]]",
		-- 	function()
		-- 		Snacks.words.jump(vim.v.count1)
		-- 	end,
		-- 	desc = "Next Reference",
		-- 	mode = { "n", "t" },
		-- },
		-- {
		-- 	"[[",
		-- 	function()
		-- 		Snacks.words.jump(-vim.v.count1)
		-- 	end,
		-- 	desc = "Prev Reference",
		-- 	mode = { "n", "t" },
		-- },
	},
	init = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				vim.g.snacks_animate = false
				-- Setup some globals for debugging (lazy-loaded)
				_G.dd = function(...)
					Snacks.debug.inspect(...)
				end
				_G.bt = function()
					Snacks.debug.backtrace()
				end
				vim.print = _G.dd -- Override print to use snacks for `:=` command
			end,
		})
	end,
}
