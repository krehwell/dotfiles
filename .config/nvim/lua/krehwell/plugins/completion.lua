return {
    "saghen/blink.cmp",
    event = "BufReadPre",
    version = "*",
    dependencies = { "joelazar/blink-calc" },

    config = function(_, opts)
        local capabilities = require("blink.cmp").get_lsp_capabilities(nil, true)
        vim.lsp.config("*", { capabilities = capabilities })
        require("blink.cmp").setup(opts)
    end,

    opts = {
        keymap = { preset = "enter" },
        cmdline = { enabled = false },

        sources = {
            default = { "lsp", "path", "buffer", "calc" },
            providers = { calc = { name = "Calc", module = "blink-calc" } },
        },

        signature = { enabled = true },

        completion = {
            menu = {
                draw = {
                    columns = {
                        { "label",      "label_description", gap = 1 },
                        { "kind_icon",  "kind",              gap = 1 },
                        { "source_name" },
                    },
                },
            },
            documentation = { auto_show = true, auto_show_delay_ms = 250 },
        },
    },
}
