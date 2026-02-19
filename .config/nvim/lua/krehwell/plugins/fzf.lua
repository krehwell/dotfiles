return {
	"ibhagwan/fzf-lua",
	dependencies = {
		{ "junegunn/fzf", build = "./install --bin" },
	},
	config = function()
		require("fzf-lua").register_ui_select()

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
			},
			files = { 
                -- formatter = "path.filename_first" 
            },
			grep = {},
			git = {},
		})
	end,

	cmd = { "FzfLua" },

	keys = {
		{ "<C-f>", ":lua require('fzf-lua').grep()<CR><CR><C-g>", desc = "Fuzzy search (Regex)", silent = true },
		{ "<C-k>", ":lua require('fzf-lua').grep()<CR><CR>", desc = "Fuzzy search", silent = true },
		{ "fzf", "<cmd>lua require('fzf-lua').builtin()<CR>", desc = "FzfLua features list" },
		{ "fzr", "<cmd>lua require('fzf-lua').resume()<CR>", desc = "FzfLua last fzf-lua picker" },
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
		{ "gl", "<cmd>lua require('fzf-lua').buffers()<CR>", desc = "FzfLua Buffers", silent = true },
		{ "<leader>t", "<cmd>lua require('fzf-lua').tagstack()<CR>", desc = "FzfLua Tag Stack", silent = true },
	},
}
