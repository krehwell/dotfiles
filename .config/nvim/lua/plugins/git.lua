vim.opt.diffopt = vim.opt.diffopt + "vertical"

vim.env.GIT_OPTIONAL_LOCKS = "0"

return {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    dependencies = {
        { "tpope/vim-fugitive" },
        { "tpope/vim-rhubarb" },
        {
            "esmuellert/codediff.nvim",
            cmd = "CodeDiff",
            opts = {
                explorer = { position = "bottom", focus_on_select = true, initial_focus = "modified" },
                history = { initial_focus = "modified" },
            },
        },
    },

    keys = {
        {
            "gs",
            function()
                vim.cmd("Git")
                vim.cmd("resize " .. math.floor(vim.o.lines * 0.25))
                vim.cmd.normal({ "5j" })
            end,
            desc = "Git: toggle status",
        },
        { "dv", ":Gvdiffsplit!<CR>", desc = "Git: open 3-way merge diff" },
        {
            "gp",
            function() vim.cmd("Gitsigns preview_hunk") end,
            desc = "Git: preview hunk",
            silent = true,
        },
        {
            "gu",
            function() vim.cmd("Gitsigns reset_hunk") end,
            desc = "Git: reset current lines change",
        },
        {
            "]c",
            function()
                if vim.wo.diff then
                    vim.cmd.normal({ "]c", bang = true })
                else
                    require("gitsigns").nav_hunk("next", { target = "all" })
                end
            end,
            desc = "Git: jump to next line change",
        },
        {
            "[c",
            function()
                if vim.wo.diff then
                    vim.cmd.normal({ "[c", bang = true })
                else
                    require("gitsigns").nav_hunk("prev", { target = "all" })
                end
            end,
            desc = "Git: jump to prev line change",
        },
    },

    opts = {
        signs = {
            add = { text = "+" },
            change = { text = "~" },
            delete = { text = "_" },
            topdelete = { text = "‾" },
            changedelete = { text = "_" },
            untracked = { text = "┆" },
        },
        signcolumn = true,
        numhl = true,
        attach_to_untracked = true,

        watch_gitdir = { interval = 1000, follow_files = true },

        current_line_blame = true,
        current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
            delay = 650,
            ignore_whitespace = false,
            virt_text_priority = 1000,
        },
    },
}
