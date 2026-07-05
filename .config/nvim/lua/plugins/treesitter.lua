return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    cond = function()
        return vim.fn.executable("cc") == 1 or vim.fn.executable("gcc") == 1 or vim.fn.executable("clang") == 1
    end,
    lazy = false,
    config = function()
        local ts = require("nvim-treesitter")

        ts.install({
            "tsx",
            "typescript",
            "javascript",
            "html",
            "css",
            "json",
            "lua",
            "vim",
            "vimdoc",
            "query",
            "markdown",
            "markdown_inline",
        })

        vim.api.nvim_create_autocmd("FileType", {
            pattern = {
                "tsx",
                "typescript",
                "typescriptreact",
                "javascript",
                "javascriptreact",
                "html",
                "css",
                "json",
                "lua",
                "vim",
                "markdown",
            },
            callback = function()
                pcall(vim.treesitter.start)
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end,
}
