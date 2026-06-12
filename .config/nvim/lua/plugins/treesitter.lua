return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    -- Don't run the plugin on machines that can't build parsers (e.g. a bare
    -- VPS with no compiler); the main branch compiles parsers with a C compiler.
    cond = function()
        return vim.fn.executable("cc") == 1
            or vim.fn.executable("gcc") == 1
            or vim.fn.executable("clang") == 1
    end,
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
