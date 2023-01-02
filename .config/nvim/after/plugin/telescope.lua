local present, telescope = pcall(require, "telescope")
if not present then
	return
end

local actions = require("telescope.actions")

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<c-["] = actions.close,
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
				width = 115,
				height = 22,
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
require("telescope").load_extension("fzf")

function FallbackFindFiles()
	local ok = pcall(require("telescope.builtin").git_files)
	if not ok then
		require("telescope.builtin").find_files()
	end
end

vim.keymap.set("n", "<C-p>", ":lua FallbackFindFiles()<CR>")
vim.keymap.set(
	"n",
	"<C-f>",
	":lua require'telescope.builtin'.grep_string{ shorten_path = true, word_match = \"-w\", only_sort_text = true, search = '' }<CR>"
)
-- vim.keymap.set("n", "<C-f>", "<CMD>Telescope live_grep<CR>") -- this is pretty cool too since we can use regex
vim.api.nvim_create_user_command("Ls", "Telescope buffers", { nargs = 0, bang = true })
vim.api.nvim_create_user_command("LS", "Telescope buffers", { nargs = 0, bang = true })
vim.api.nvim_create_user_command("Colors", "Telescope colorscheme", { nargs = 0, bang = true })
