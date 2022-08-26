local action_state = require('telescope.actions.state')
local actions = require('telescope.actions')

require("telescope").setup {
    defaults = {
        -- Your defaults config goes in here
        mappings = {
            i = {
                ["<c-["] = actions.close,
            }
        },
    },
    pickers = {
        -- Your special builtin config goes in here
        buffers = {
            ignore_current_buffer = true,
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
    extensions = { }
}

require('telescope').load_extension('fzf')
