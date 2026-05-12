return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPost", "BufWritePost", "InsertLeave" },
    config = function()
        vim.filetype.add({ extension = { env = "dotenv" }, pattern = { ["%.env%..*"] = "dotenv" }, })

        local lint = require("lint")

        lint.linters_by_ft = {
            dockerfile = { "hadolint" },
            dotenv = { "dotenv_linter" },
        }

        local group = vim.api.nvim_create_augroup("krehwell/lint", { clear = true })
        vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
            group = group,
            callback = function()
                require("lint").try_lint()
            end,
        })
    end,
}
