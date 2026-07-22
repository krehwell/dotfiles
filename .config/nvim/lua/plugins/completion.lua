return {
    "saghen/blink.cmp",
    event = "BufReadPre",
    version = "*",
    dependencies = { "joelazar/blink-calc", "windwp/nvim-ts-autotag", "windwp/nvim-autopairs" },

    config = function(_, opts)
        local capabilities = require("blink.cmp").get_lsp_capabilities(nil, true)
        vim.lsp.config("*", { capabilities = capabilities })

        require("nvim-ts-autotag").setup({})
        require("nvim-autopairs").setup({})
        require("blink.cmp").setup(opts)
    end,

    opts = {
        keymap = { preset = "enter" },
        cmdline = { enabled = true },

        fuzzy = { implementation = "rust" },

        sources = {
            default = { "lsp", "path", "buffer", "calc" },
            providers = { calc = { name = "Calc", module = "blink-calc" } },
        },

        signature = { enabled = true },

        completion = {
            documentation = { auto_show = true, auto_show_delay_ms = 250 },
        },
    },
}
