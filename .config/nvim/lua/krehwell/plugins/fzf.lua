return {
	"ibhagwan/fzf-lua",
	dependencies = {
		{ "junegunn/fzf", build = "./install --bin" },
	},
	config = function()
		vim.api.nvim_create_user_command("Ls", "FzfLua buffers", { nargs = 0, bang = true })
		vim.api.nvim_create_user_command("LS", "FzfLua buffers", { nargs = 0, bang = true })
		vim.api.nvim_create_user_command("Lls", "FzfLua buffers", { nargs = 0, bang = true })

		require("fzf-lua").register_ui_select()
		local actions = require("fzf-lua.actions")

		require("fzf-lua").setup({
			{ "default-title" },
			desc = "fzf lua default options",
			winopts = {
				width = 0.94,
				height = 0.75,
				-- fullscreen = true,
				preview = { default = "bat", horizontal = "right:47%" },
			},
			manpages = { previewer = "man_native" },
			helptags = { previewer = "help_native" },
			lsp = { code_actions = { previewer = "codeaction_native" } },
			tags = { previewer = "bat" },
			btags = { previewer = "bat" },
			lines = { _treesitter = false },
			blines = { _treesitter = false },
			buffers = {
				formatter = "path.filename_first",
				actions = { ["ctrl-d"] = { fn = actions.buf_del, reload = true } },
			},
			files = { formatter = "path.filename_first" },
			grep = {},
			git = {},
		})
	end,

	cmd = { "FzfLua", "Ls", "LS" },

	keys = {
		{ "<C-f>", ":lua require('fzf-lua').grep()<CR><CR><C-g>", desc = "Fuzzy search (Regex)", silent = true },
		{ "<C-k>", ":lua require('fzf-lua').grep()<CR><CR>", desc = "Fuzzy search", silent = true },
		{ "<leader>fzf", "<cmd>lua require('fzf-lua').builtin()<CR>", desc = "FzfLua features list", silent = true },
		{ "ga", "<cmd>lua require('fzf-lua').grep_cword()<CR>", desc = "Any jump", silent = true },
		{
			"<c-p>",
			function()
				if vim.fn.getcwd() == os.getenv("HOME") then
					return require("fzf-lua").git_files()
				end
				local extend = function(table1, table2)
					return vim.tbl_extend("force", table1, table2)
				end
				return require("fzf-lua").files(extend({}, {
					cmd = "rg --files --hidden --ignore --glob='!.git' --sortr=modified",
					fzf_opts = { ["--scheme"] = "path", ["--tiebreak"] = "index" },
				}))
			end,
			desc = "Project find files",
			silent = true,
		},
		{ "<leader>l", "<cmd>lua require('fzf-lua').buffers()<CR>", desc = "FzfLua Buffers", silent = true },
		{ "<leader>t", "<cmd>lua require('fzf-lua').tagstack()<CR>", desc = "FzfLua Tag Stack", silent = true },
	},
}
