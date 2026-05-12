return {
    -- LSP HELPER RELATED
    {
        "folke/trouble.nvim",
        cmd = "Trouble",
        keys = {
            { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
        },
    },
    {
        "axelvc/template-string.nvim",
        config = function()
            require("template-string").setup({
                filetypes = { "html", "typescriptreact", "javascriptreact", "typescript", "javascript" },
                jsx_brackets = true,
                remove_template_string = true,
                restore_quotes = { normal = [["]], jsx = [["]] },
            })
        end,
    },

    -- HELPERS/NAVIGATIONS
    {
        "stevearc/quicker.nvim",
        event = "FileType qf",
        opts = {
            wrap = false,
            keys = {
                {
                    ">",
                    function()
                        require("quicker").expand({ before = 2, after = 2, add_to_existing = true })
                    end,
                    desc = "Expand quickfix context",
                },
                {
                    "<",
                    function()
                        require("quicker").collapse()
                    end,
                    desc = "Collapse quickfix context",
                },
            },
        },
    },
    {
        "justinmk/vim-gtfo",
        keys = { { "gof", desc = "Go to folder" }, { "got", desc = "Go to terminal" } },
    },
    {
        "isomoar/vim-css-to-inline",
        keys = {
            { "tis", desc = "Transform to inline styles" },
            { "fis", desc = "Transform from inline styles to css" },
        },
    },
    {
        "tpope/vim-surround",
        keys = {
            { "cs", "<Plug>VSurround", desc = "Change surround",  mode = "n" },
            { "ds", "<Plug>Dsurround", desc = "Delete surround",  mode = "n" },
            { "ys", "<Plug>Ysurround", desc = "Yank surround",    mode = "n" },
            { "S",  mode = "v",        desc = "Surround selected" },
        },
    },
    { "tpope/vim-repeat", keys = { { "." } } },
}
