function FallbackFindFiles()
	local ok = pcall(require("telescope.builtin").git_files)
	if not ok then
		require("telescope.builtin").find_files()
	end
end

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.1",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = vim.fn.executable("make") == 1,
		},
	},
	opts = function()
		require("telescope").load_extension("fzf")
		local actions = require("telescope.actions")
		local telescope = require("telescope")

		vim.api.nvim_create_user_command("Ls", "Telescope buffers", { nargs = 0, bang = true })
		vim.api.nvim_create_user_command("LS", "Telescope buffers", { nargs = 0, bang = true })

		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<esc>"] = actions.close,
					},
				},
			},
			pickers = {
				buffers = {
					initial_mode = "insert",
					ignore_current_buffer = true,
					sort_lastused = true,
					theme = "dropdown",
					previewer = false,
					mappings = {
						i = {
							["<c-d>"] = actions.delete_buffer,
						},
						n = {
							["<c-d>"] = actions.delete_buffer,
						},
					},
					layout_config = {
						width = 125,
						height = 30,
					},
				},
				find_files = {
					theme = "ivy",
					layout_strategies = "vertical",
					layout_config = {
						height = 11,
					},
					hidden = true,
				},
				git_files = {
					theme = "ivy",
					layout_strategies = "vertical",
					layout_config = {
						height = 11,
					},
					hidden = true,
				},
				grep_string = {
					prompt_prefix = "🔍 ",
					no_ignore = true,
					file_ignore_patterns = { "%.png", "%.jpg", "%.jpeg", "%.gif", "%.webp", "%.svg", "%.tsbuildinfo" },
					layout_config = { width = 180, height = 45 },
				},
			},
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					override_live_grep_sorter = true,
					case_mode = "smart_case", -- or "ignore_case" or "respect_case", default "smart_case"
				},
			},
		})
	end,
	cmd = { "Telescope" },
	keys = {
		{ "<C-p>", ":lua FallbackFindFiles()<CR>" },
		{
			"<C-f>",
			":lua require'telescope.builtin'.grep_string{ shorten_path = true, word_match = \"-w\", only_sort_text = false, search = '' }<CR>",
		},
	},
}
