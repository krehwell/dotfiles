function _G.get_oil_winbar()
    local dir = require("oil").get_current_dir()
    if dir then
        local root = vim.fn.getcwd()
        local relative_path = vim.fn.fnamemodify(dir, ":p"):sub(#root + 2)

        if relative_path == "" then
            return vim.fn.fnamemodify(root, ":~")
        else
            return relative_path
        end
    else
        -- If there is no current directory (e.g. over ssh), just show the buffer name
        return vim.api.nvim_buf_get_name(0)
    end
end

-- open oil, step one entry in `motion` ("j"/"k"), then open that file
local function oil_step(motion)
    return function()
        local oil = require("oil")
        oil.open(nil, {}, function()
            vim.schedule(function()
                vim.cmd("normal! " .. motion)
                oil.select()
            end)
        end)
    end
end

return {
    "stevearc/oil.nvim",
    lazy = false,
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
        default_file_explorer = true,
        lsp_file_methods = { enabled = true, timeout_ms = 10000, autosave_changes = true },

        watch_for_changes = true,

        view_options = {
            show_hidden = true,
        },

        delete_to_trash = true,

        keymaps = {
            ["<C-h>"] = { "actions.parent" },
            ["<C-l>"] = { "actions.select" },
            ["<C-c>"] = false,
            ["<C-p>"] = false,
            ["y%"] = function()
                local oil = require("oil")
                local dir = oil.get_current_dir()
                local relative = vim.fn.fnamemodify(dir, ":.")
                vim.fn.setreg("+", relative)
                vim.notify("Copied relative dir: " .. relative)
            end,
        },

        skip_confirm_for_simple_edits = true,
        prompt_save_on_select_new_entry = false,
        win_options = { winbar = "%!v:lua.get_oil_winbar()" },
    },
    keys = {
        { "]f", oil_step("j"), desc = "Open next file in Oil" },
        { "[f", oil_step("k"), desc = "Open prev file in Oil" },
        {
            "<C-b>",
            function()
                require("oil").open()
            end,
            desc = "Toggle file explorer (oil.nvim)",
            silent = true,
        },
    },
}
