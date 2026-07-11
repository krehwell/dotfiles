-- BEAUTIFY
return {
    "nvim-mini/mini.icons",
    priority = 1000,
    dependencies = {
        {
            "j-hui/fidget.nvim",
            event = "LspAttach",
            opts = { notification = { window = { winblend = 0 } } },
        },
    },
    config = function()
        require("mini.icons").setup()
        vim.cmd([[ colorscheme base24 ]])
    end,
}
