local detail = false

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

-- copy current oil dir as "@<relative path>"
local function oil_copy_relative_dir()
    local oil = require("oil")
    local dir = oil.get_current_dir()
    local relative = vim.fn.fnamemodify(dir, ":.")
    vim.fn.setreg("+", "@" .. relative .. " ")
    vim.notify("Copied relative dir: " .. relative)
end

-- toggle extra file detail columns
local function oil_toggle_detail()
    detail = not detail
    if detail then
        require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
    else
        require("oil").set_columns({ "icon" })
    end
end

-- open oil, step one entry in `motion` ("j"/"k"), then open that file
local function oil_step(motion)
    return function()
        local oil = require("oil")
        oil.open(nil, {}, function()
            vim.schedule(function()
                vim.cmd("normal! " .. motion)

                local row = vim.api.nvim_win_get_cursor(0)[1]
                local filename = vim.api.nvim_buf_get_lines(0, row - 1, row, false)[1]
                -- landed on the "../" parent entry: step back so we open a real file
                if not filename or string.find(filename, "../", 1, true) then
                    vim.cmd("normal! " .. (motion == "j" and "k" or "j"))
                end

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
            ["y%"] = oil_copy_relative_dir,
            ["<C-b>"] = { desc = "Toggle file detail view", callback = oil_toggle_detail },
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
            function() require("oil").open() end,
            desc = "Toggle file explorer (oil.nvim)",
            silent = true,
        },
    },
}
