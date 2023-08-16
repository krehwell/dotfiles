return {
  "ibhagwan/fzf-lua",
  dependencies = {
    { "junegunn/fzf", build = "./install --bin" },
  },
  config = function()
    local actions = require("fzf-lua.actions")

    vim.api.nvim_create_user_command("Ls", "FzfLua buffers", { nargs = 0, bang = true })
    vim.api.nvim_create_user_command("LS", "FzfLua buffers", { nargs = 0, bang = true })

    require("fzf-lua").setup({
      winopts = {
        preview = {
          scrollbar = "border",
          preview = {
            default = false, -- "bat" -- I don't use colorscheme, so this is useless
          },
        },
      },

      lsp = {
        fzf_opts = { ["--layout"] = "default", ["--marker"] = "+" },
        winopts = {
          height = 0.85,
          width = 0.77,
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
          preview = { default = false, horizontal = "right:45%" },
        },
      },

      git = {
        files = {
          prompt = "GitFiles❯ ",
          winopts = {
            height = 0.2,
            width = 1,
            row = 1.0,
            col = 0.0,
            preview = { default = false, horizontal = "right:45%" },
          },
        },
      },

      keymap = {
        builtin = {
          ["<F1>"] = "toggle-help",
          ["<F2>"] = "toggle-fullscreen",
          -- Only valid with the 'builtin' previewer
          ["<F3>"] = "toggle-preview-wrap",
          ["<F4>"] = "toggle-preview",
          ["<F5>"] = "toggle-preview-ccw",
          ["<F6>"] = "toggle-preview-cw",
          ["<C-d>"] = "preview-page-down",
          ["<C-u>"] = "preview-page-up",
          ["<S-left>"] = "preview-page-reset",
        },
        fzf = {
          ["ctrl-z"] = "abort",
          ["ctrl-f"] = "half-page-down",
          ["ctrl-b"] = "half-page-up",
          ["ctrl-a"] = "beginning-of-line",
          ["ctrl-e"] = "end-of-line",
          ["alt-a"] = "toggle-all",
          -- Only valid with fzf previewers (bat/cat/git/etc)
          ["f3"] = "toggle-preview-wrap",
          ["f4"] = "toggle-preview",
          ["ctrl-d"] = "preview-page-down",
          ["ctrl-u"] = "preview-page-up",
          ["ctrl-q"] = "select-all+accept",
        },
      },
    })
  end,
  cmd = { "FzfLua", "Ls", "LS" },
  keys = {
    { "<C-f>",       ":lua require('fzf-lua').grep({})<CR><CR>",  desc = "Fuzzy search",         silent = true },
    { "<leader><leader>fzf", "<cmd>lua require('fzf-lua').builtin()<CR>", desc = "FzfLua features list", silent = true },
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
    { "<leader>p", "<cmd>lua require('fzf-lua').git_files()<CR>", desc = "Git files", silent = true },
  },
}
