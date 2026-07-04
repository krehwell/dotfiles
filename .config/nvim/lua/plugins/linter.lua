local lint_events = { "BufReadPost", "BufWritePost", "InsertLeave" }

return {
    "mfussenegger/nvim-lint",
    event = lint_events,
    config = function()
        local lint = require("lint")
        vim.api.nvim_create_autocmd(lint_events, {
            group = vim.api.nvim_create_augroup("lint", { clear = true }),
            callback = function() lint.try_lint() end,
        })
    end,
}
