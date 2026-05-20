return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    -- main branch does not lazy-load cleanly; load at startup so the
    -- FileType autocmd below is registered before the first buffer opens.
    lazy = false,
    config = function()
        local ts = require("nvim-treesitter")

        -- async install; no-op if a parser is already present
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

        -- highlighting + experimental treesitter indentation per filetype
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
