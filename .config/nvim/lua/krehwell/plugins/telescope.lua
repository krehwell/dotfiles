return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  opts = function()
    require("telescope").load_extension("fzf")

    local telescope, builtin, actions, action_state =
        require("telescope"),
        require("telescope.builtin"),
        require("telescope.actions"),
        require("telescope.actions.state")

    -- vim.api.nvim_create_user_command("Ls", "Telescope buffers", { nargs = 0, bang = true })
    -- vim.api.nvim_create_user_command("LS", "Telescope buffers", { nargs = 0, bang = true })
    -- to to project file with `git_files` or fallback to `find_files`
    -- function FallbackFindFiles()
    -- 	local ok = pcall(require("telescope.builtin").git_files)
    -- 	if not ok then
    -- 		require("telescope.builtin").find_files()
    -- 	end
    -- end
    -- vim.keymap.set("n", "<leader>p", ":lua FallbackFindFiles()<CR>", { silent = true })

    local force_delete_buffer = function(prompt_bufnr)
      local current_picker = action_state.get_current_picker(prompt_bufnr)
      current_picker:delete_selection(function(selection)
        vim.api.nvim_buf_delete(selection.bufnr, { force = true })
      end)
    end

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
              ["<c-d>"] = force_delete_buffer,
            },
            n = {
              ["<c-d>"] = force_delete_buffer,
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
          layout_config = { height = 11 },
          hidden = true,
        },
        git_files = {
          theme = "ivy",
          layout_strategies = "vertical",
          layout_config = { height = 11 },
          hidden = true,
        },
        grep_string = {
          prompt_prefix = "🔍 ",
          no_ignore = true,
          file_ignore_patterns = { "%.png", "%.jpg", "%.jpeg", "%.gif", "%.webp", "%.svg", "%.tsbuildinfo" },
          layout_config = { width = 180, height = 45 },
        },
        lsp_references = {
          layout_config = { width = 185, height = 45 },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,              -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          override_live_grep_sorter = true,
          case_mode = "smart_case",  -- or "ignore_case" or "respect_case", default "smart_case"
        },
      },
    })
  end,
  cmd = { "Telescope" },
  keys = {
    -- { "<leader>p", ":lua FallbackFindFiles()<CR>", desc = "Find files", silent = true },
    -- {
    -- 	"<C-p>",
    -- 	':lua require("telescope.builtin").find_files()<CR>',
    -- 	desc = "Project find files",
    -- 	silent = true,
    -- },
  },
}
