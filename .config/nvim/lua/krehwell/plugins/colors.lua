return {
    "lengarvey/base16-vim",
    priority = 1000,
    dependencies = {
        -- BEAUTIFY
        { "DaikyXendo/nvim-material-icon", event = "BufReadPre" },
        { "j-hui/fidget.nvim",             event = "LspAttach", opts = { notification = { window = { winblend = 0 } } } },
    },
    config = function()
        vim.cmd([[ colorscheme no-distraction ]])
    end,
}
