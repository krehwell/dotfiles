require('telescope').load_extension('media_files')
local action_state = require('telescope.actions.state')
local actions = require('telescope.actions')

require("telescope").setup {
    defaults = {
        -- Your defaults config goes in here
        mappings = {
            i = {
                ["<c-[>"] = actions.close,
            }
        },
    },
    pickers = {
        -- Your special builtin config goes in here
        buffers = {
            sort_lastused = true,
            theme = "dropdown",
            previewer = false,
            mappings = {
                i = {
                    ["<c-d>"] = actions.delete_buffer,
                },
                n = {
                    ["<c-d>"] = actions.delete_buffer,
                }
            }
        },
        find_files = {
            -- theme = "get_ivy"
        }
    },
    extensions = {
        media_files = {
            -- filetypes whitelist
            -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
            -- filetypes = {"png", "webp", "jpg", "jpeg"},
            find_cmd = "rg" -- find command (defaults to `fd`)
        }
    }
}

require('telescope').load_extension('fzf')
