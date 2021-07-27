-- FALLING BACK TO FIND_FILES IF GIT_FILES CAN'T FIND A .GIT DIRECTORY
local M = {}

M.project_files = function()
    local opts = require('telescope.themes').get_ivy({
        previewer = false,
        layout_strategies = "vertical",
        layout_config = {
            height = 9,
            prompt_position = 'bottom',
        },
    }) -- define options here
    local ok = pcall(require'telescope.builtin'.git_files, opts)
    if not ok then require'telescope.builtin'.find_files(opts) end
end

return M

-- call via:
-- :lua require'fallback-findfiles'.project_files()

-- example keymap:
-- vim.api.nvim_set_keymap('n', '<Leader><Space>', '<CMD>lua require\'telescope-config\'.project_files()<CR>', {noremap = true, silent = true})

