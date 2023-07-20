return {
	"ibhagwan/fzf-lua",
	dependencies = {
		{ "junegunn/fzf", build = "./install --bin" },
	},
	config = function()
		local actions = require("fzf-lua.actions")

		vim.api.nvim_create_user_command("Ls", "Buffer List", { nargs = 0, bang = true })
		vim.api.nvim_create_user_command("LS", "Buffer List", { nargs = 0, bang = true })

		require("fzf-lua").setup({
			winopts = {
				preview = {
					scrollbar = "border",
					preview = {
						default = false, -- "bat" -- I don't use colorscheme, so this is useless
					},
				},
			},
			grep = {
				fzf_opts = { ["--layout"] = "default", ["--marker"] = "+" },
				rg_glob = true,
				glob_flah = "--glob",
				glob_separator = "%s%-%-",
				winopts = {
					height = 0.95,
					width = 0.95,
					title = "Live Grep",
					title_pos = "center",
					preview = {
						vertical = "up:45%",
						horizontal = "right:50%",
						layout = "flex",
						flip_columns = 120,
					},
				},
			},
			buffers = {
				winopts = { height = 0.6, width = 0.5 },
				previewer = false,
				actions = {
					["ctrl-d"] = { fn = actions.buf_del, reload = true },
				},
			},
			files = {
				winopts = {
					title = "Find Files",
					title_pos = "center",
					height = 0.2,
					width = 1,
					row = 1.0,
					col = 0.0,
				},
				preview = { default = false, vertical = "down:10%" },
			},
			git = {
				files = {
					prompt = "GitFiles❯ ",
					winopts = { height = 0.2, width = 1, row = 1.0, col = 0.0 },
					preview = { default = false, vertical = "down:10%" },
				},
			},
		})
	end,
	cmd = { "FzfLua", "Ls", "LS" },
	keys = {
		{ "<C-f>", ":lua require('fzf-lua').grep({})<CR><CR>", desc = "fuzzy search", silent = true },
		{ "<leader>fzf", "<cmd>lua require('fzf-lua').builtin()<CR>", desc = "FzfLua features list", silent = true },
		{ "<c-p>", "<cmd>lua require('fzf-lua').files()<CR>", desc = "Project find files", silent = true },
		{ "<leader>p", "<cmd>lua require('fzf-lua').git_files()<CR>", desc = "Git files", silent = true },
	},
}
