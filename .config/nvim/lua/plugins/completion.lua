return {
    "saghen/blink.cmp",
    event = "BufReadPre",
    version = "*",
    dependencies = {
        "joelazar/blink-calc",
        "windwp/nvim-ts-autotag",
        "windwp/nvim-autopairs",
    },

    config = function(_, opts)
        local capabilities = require("blink.cmp").get_lsp_capabilities(nil, true)
        vim.lsp.config("*", { capabilities = capabilities })

        require("nvim-ts-autotag").setup({})
        require("nvim-autopairs").setup({})
        require("blink.cmp").setup(opts)
    end,

    opts = {
        keymap = { preset = "enter" },
        cmdline = { enabled = false },

        -- guarantee the native Rust matcher; error loudly instead of
        -- silently falling back to the (much slower) Lua matcher
        fuzzy = { implementation = "rust" },

        sources = {
            default = { "lsp", "path", "buffer", "calc" },
            providers = { calc = { name = "Calc", module = "blink-calc" } },
        },

        signature = { enabled = true },

        completion = {
            menu = {
                draw = {
                    columns = {
                        { "label", "label_description", gap = 1 },
                        { "kind_icon", "kind", gap = 1 },
                        { "source_name" },
                    },
                },
            },
            documentation = { auto_show = true, auto_show_delay_ms = 250 },
        },
    },
}
