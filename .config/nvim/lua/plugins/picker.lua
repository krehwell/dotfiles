return {
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
        {
            "<C-f>",
            function() require("snacks").picker.grep() end,
            desc = "Fuzzy search (Regex)",
            silent = true,
        },
        {
            "<C-k>",
            function() require("snacks").picker.grep({ live = false, need_search = false }) end,
            desc = "Fuzzy search (grep + filter)",
            silent = true,
        },
        {
            "ga",
            function()
                require("snacks").picker.grep({
                    live = false,
                    regex = false,
                    search = function(picker) return picker:word() end,
                })
            end,
            mode = { "n", "x" },
            desc = "Grep word/selection under cursor",
            silent = true,
        },
        {
            "<C-Tab>",
            function() require("snacks").picker.buffers() end,
            desc = "Buffers",
            silent = true,
        },
        {
            "<F1>",
            function() require("snacks").picker.pickers() end,
            desc = "All pickers",
            silent = true,
        },
    },
    opts = {
        picker = {
            enabled = true,
            ui_select = false,
            -- wider than the 0.8 default; preset logic (default/vertical) untouched.
            layout = { layout = { width = 0.9 } },
            win = {
                input = { keys = { ["<Esc>"] = { "close", mode = { "n", "i" } } } },
            },
        },
    },
}
