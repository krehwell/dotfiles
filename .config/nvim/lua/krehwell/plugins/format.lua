return {
    "stevearc/conform.nvim",
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                lua = { "stylua" },
                javascript = { "biome" },
                typescript = { "biome" },
                javascriptreact = { "biome" },
                typescriptreact = { "biome" },
                go = { "goimports_reviser", "goimports", "golines" },
            },

            format_on_save = false, -- { lsp_format = "fallback", timeout_ms = 500, },
        })

        vim.keymap.set("n", "gq", function()
            conform.format(vim.tbl_extend("force", { lsp_fallback = true, async = false }, opts or {}))
        end, opts)
    end,
}
