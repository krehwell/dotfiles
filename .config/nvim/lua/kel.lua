local action_state = require('telescope.actions.state')

require("telescope").setup {
    defaults = {
        -- Your defaults config goes in here
        mappings = {
            i = {
                ["<c-[>"] = require('telescope.actions').close,
            }
        }
    },
    pickers = {
        -- Your special builtin config goes in here
        buffers = {
            -- sort_lastused = true,
            theme = "dropdown",
            previewer = false,
            mappings = {
                i = {
                    ["<c-d>"] = "delete_buffer",
                },
                n = {
                    ["<c-d>"] = require("telescope.actions").delete_buffer,
                }
            }
        },
        find_files = {
            -- theme = "get_ivy"
        }
    },
    extensions = {
        -- Your extension config goes in here
    }
}
require('telescope').load_extension('fzf')
