-- only show these, I don't need deep complex dropbar info
local symbol_filter = { valid_types = { "constructor", "function" }, max_depth = 2 }

return {
    "Bekaboo/dropbar.nvim",
    opts = {
        sources = { treesitter = symbol_filter, lsp = symbol_filter },
    },
    config = function(_, opts)
        vim.o.statusline = "%#WinSeparator#" -- don't need statusline as it's now replaced with dropbar
        require("dropbar").setup(opts)
    end,
}
