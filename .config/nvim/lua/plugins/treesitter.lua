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

        -- filetypes to highlight/indent; parser names derived (typescriptreact -> tsx)
        local fts = { "typescript", "typescriptreact", "javascript", "javascriptreact", "html", "css", "json", "lua", "vim", "markdown" }
        local parsers = { "vimdoc", "query", "markdown_inline" } -- injected langs, no FileType hook needed
        for _, ft in ipairs(fts) do
            table.insert(parsers, vim.treesitter.language.get_lang(ft))
        end
        ts.install(parsers)

        vim.api.nvim_create_autocmd("FileType", {
            pattern = fts,
            callback = function()
                pcall(vim.treesitter.start)
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end,
}
