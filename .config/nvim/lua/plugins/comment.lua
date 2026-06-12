return {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = "CursorMoved",
    init = function()
        -- turn off auto-comment
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "*",
            callback = function() vim.opt_local.formatoptions:remove({ "r", "o", "c" }) end,
        })
    end,
    opts = function()
        require("ts_context_commentstring").setup({ enable_autocmd = false })

        local get_option = vim.filetype.get_option
        vim.filetype.get_option = function(filetype, option)
            return option == "commentstring" and require("ts_context_commentstring.internal").calculate_commentstring()
                or get_option(filetype, option)
        end
    end,
}
