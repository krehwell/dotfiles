return {
    {
        "folke/snacks.nvim",
        keys = {
            {
                "<c-p>",
                function()
                    if vim.fn.getcwd() == os.getenv("HOME") then return require("snacks").picker.git_files() end
                    return require("snacks").picker.smart()
                end,
                desc = "Smart find files (frecency)",
                silent = true,
            },
        },
        opts = {
            picker = {
                enabled = true,
                ui_select = false,
                layout = { layout = { width = 0.9 } },
                win = { input = { keys = { ["<Esc>"] = { "close", mode = { "n", "i" } } } } },
            },
        },
    },
    {
        "ibhagwan/fzf-lua",
        config = function()
            require("fzf-lua").register_ui_select()

            require("fzf-lua").setup({
                { "default-title" },
                desc = "fzf lua default options",
                fzf_colors = true,
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
            })
        end,

        cmd = { "FzfLua" },

        keys = {
            -- <C-p> intentionally stays on snacks.picker (above)
            { "<C-f>", ":lua require('fzf-lua').grep()<CR><CR><C-g>", desc = "Fuzzy search (Regex)", silent = true },
            { "<C-k>", ":lua require('fzf-lua').grep()<CR><CR>", desc = "Fuzzy search", silent = true },
            { "fzf", "<cmd>lua require('fzf-lua').builtin()<CR>", desc = "FzfLua features list" },
            { "fzr", "<cmd>lua require('fzf-lua').resume()<CR>", desc = "FzfLua last fzf-lua picker" },
            { "<C-Tab>", "<cmd>lua require('fzf-lua').buffers()<CR>", desc = "FzfLua Buffers", silent = true },
            {
                "ga",
                "<cmd>lua require('fzf-lua').grep_cword()<CR>",
                desc = "FzfLua grep anyword under cursor",
                silent = true,
            },
            { "gt", "<cmd>lua require('fzf-lua').tagstack()<CR>", desc = "FzfLua Tag Stack", silent = true },
        },
    },
}
