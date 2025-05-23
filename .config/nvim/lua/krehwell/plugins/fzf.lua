return {
	"ibhagwan/fzf-lua",
	dependencies = {
		{ "junegunn/fzf", build = "./install --bin" },
	},
	config = function()
		local actions = require("fzf-lua.actions")

		vim.api.nvim_create_user_command("Ls", "FzfLua buffers", { nargs = 0, bang = true })
		vim.api.nvim_create_user_command("LS", "FzfLua buffers", { nargs = 0, bang = true })
		vim.api.nvim_create_user_command("Lls", "FzfLua buffers", { nargs = 0, bang = true })

		require("fzf-lua").setup({
			winopts = {
				preview = {
					scrollbar = "border",
					preview = {
						default = false, -- "bat" -- I don't use colorscheme, so this is useless
					},
				},
			},

			previewers = {
				builtin = {
					syntax = true,
					treesitter = { enabled = true, disabled = { "json" } },
				},
			},

			lsp = {
				multiline = 1,
				fzf_opts = { ["--layout"] = "default", ["--marker"] = "+" },
				winopts = {
					height = 0.85,
					width = 0.9,
					preview = {
						vertical = "up:45%",
						horizontal = "right:50%",
						layout = "flex",
						flip_columns = 120,
					},
				},
			},

			grep = {
				fzf_opts = { ["--layout"] = "default", ["--marker"] = "+" },
				rg_glob = true,
				glob_flah = "--glob",
				glob_separator = "%s%-%-",
				rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=4096 "
					.. "-g '!apps/mobile/*' "
					-- .. "-g '!apps/backend/*' "
					.. "-g '!apps/chrome-extension/' "
					.. "-g '!*/yarn.lock' "
					.. "-g '!yarn.lock' "
					.. "-g '!*.{pdf,doc,docx,xml}' "
					.. "-g '!*.{jpg,jpeg,png,gif,svg}' "
					.. "-g '!node_modules/*' "
					.. "-g '!.git/*'"
					.. " -e",
				multiline = 2,
				winopts = {
					height = 0.97,
					width = 0.97,
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
				formatter = "path.filename_first",
				winopts = { height = 0.7, width = 0.6 },
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
					preview = { default = false, horizontal = "right:45%" },
				},
			},

			git = {
				files = {
					prompt = "Git Files> ",
					winopts = {
						height = 0.2,
						width = 1,
						row = 1.0,
						col = 0.0,
						preview = { default = false, horizontal = "right:45%" },
					},
				},
			},
		})
	end,
	cmd = { "FzfLua", "Ls", "LS" },
	keys = {
		{ "<C-f>", ":lua require('fzf-lua').grep()<CR><CR>", desc = "Fuzzy search", silent = true },
		{ "<leader>fzf", "<cmd>lua require('fzf-lua').builtin()<CR>", desc = "FzfLua features list", silent = true },
		{ "ga", "<cmd>lua require('fzf-lua').grep_cword()<CR>", desc = "Any jump", silent = true },
		{
			"<c-p>",
			function()
				if vim.fn.getcwd() == os.getenv("HOME") then
					return require("fzf-lua").git_files()
				end
				return require("fzf-lua").files()
			end,
			desc = "Project find files",
			silent = true,
		},
		{ "<leader>p", "<cmd>lua require('fzf-lua').git_files()<CR>", desc = "FzfLua Git files", silent = true },
		{ "<leader>l", "<cmd>lua require('fzf-lua').buffers()<CR>", desc = "FzfLua Buffers", silent = true },
		{ "<leader>t", "<cmd>lua require('fzf-lua').tagstack()<CR>", desc = "FzfLua Tag Stack", silent = true },
	},
}
