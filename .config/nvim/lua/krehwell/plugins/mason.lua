return {
    "williamboman/mason.nvim",
    cmd = { "Mason" },
    dependencies = {
        { "RRethy/vim-illuminate" },
        { "WhoIsSethDaniel/mason-tool-installer.nvim" },
    },
    event = "VeryLazy",
    config = function()
        require("mason").setup()
        require("mason-tool-installer").setup({
            ensure_installed = {
                -- LSPs
                "biome",
                "css-lsp",
                "css-variables-language-server",
                "cssmodules-language-server",
                "deno",
                "gopls",
                "html-lsp",
                "json-lsp",
                "lua-language-server",
                "tailwindcss-language-server",
                "tsgo",
                -- Formatters
                "stylua",
                -- Linters
                "hadolint",
                "dotenv-linter",
            },
        })

        local lsp_utils = require("krehwell.lsp-utils")
        vim.diagnostic.config(lsp_utils.diagnostic_config)

        local servers = vim.iter(vim.api.nvim_get_runtime_file("lsp/*.lua", true))
            :map(function(file)
                return vim.fn.fnamemodify(file, ":t:r")
            end)
            :totable()
        vim.lsp.enable(servers)

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("krehwell/lsp_configure", { clear = true }),
            desc = "LSP Setup",
            callback = function(event)
                lsp_utils.on_attach(event.buf)
            end,
        })
    end,
}
