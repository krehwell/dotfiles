return {
    "stevearc/conform.nvim",
    config = function()
        local conform = require("conform")

        -- don't format deno project please
        local function ts_formatter(bufnr)
            if require("lsp-utils").deno_root(bufnr) then return { "deno_fmt" } end
            return { "biome" }
        end

        conform.setup({
            formatters_by_ft = {
                lua = { "stylua" },
                javascript = ts_formatter,
                typescript = ts_formatter,
                javascriptreact = ts_formatter,
                typescriptreact = ts_formatter,
                go = { "goimports_reviser", "goimports", "golines" },
            },

            format_on_save = false, -- { lsp_format = "fallback", timeout_ms = 500, },
        })

        vim.keymap.set("n", "gq", function() conform.format({ lsp_fallback = true, async = false }) end)
    end,
}
