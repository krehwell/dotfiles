-- BEAUTIFY
return {
    "DaikyXendo/nvim-material-icon",
    event = "BufReadPre",
    opts = { default = true },
    priority = 1000,
    dependencies = {
        {
            "j-hui/fidget.nvim",
            event = "LspAttach",
            opts = { notification = { window = { winblend = 0 } } },
        },
    },
    config = function()
        vim.cmd([[ colorscheme base16 ]])
    end,
}
