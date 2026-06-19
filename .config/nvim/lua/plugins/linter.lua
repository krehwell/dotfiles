local lint_events = { "BufReadPost", "BufWritePost", "InsertLeave" }

return {
    "mfussenegger/nvim-lint",
    event = lint_events,
    config = function()
        vim.filetype.add({ extension = { env = "dotenv" }, pattern = { ["%.env%..*"] = "dotenv" } })

        local lint = require("lint")

        lint.linters_by_ft = {
            dockerfile = { "hadolint" },
            dotenv = { "dotenv_linter" },
        }

        vim.api.nvim_create_autocmd(lint_events, {
            group = vim.api.nvim_create_augroup("lint", { clear = true }),
            callback = function() lint.try_lint() end,
        })
    end,
}
