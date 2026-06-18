vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

--- BASIC MAPPING
vim.keymap.set("n", "<Leader>-", ":vertical resize -23<CR>")
vim.keymap.set("n", "<Leader>=", ":vertical resize +23<CR>")
vim.keymap.set({ "i", "s", "n" }, "<esc>", function()
    vim.cmd("noh")
    return "<esc>"
end, { desc = "Escape, clear hlsearch, and stop snippet session", expr = true })

vim.keymap.set("n", "<C-g>", function()
    local get_git_branch = function()
        local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
        return #branch > 0 and " | branch: " .. branch or ""
    end

    local filename = vim.fn.expand("%:.")
    local modified = vim.bo.modified and "[+]" or ""
    local readonly = vim.bo.readonly and "[RO]" or ""
    local line_num = vim.fn.line(".")
    local total_lines = vim.fn.line("$")
    local percentage = math.floor(100 * line_num / total_lines)

    local msg = string.format(
        '"%s"%s%s line %d/%d --%d%%-- %s',
        filename,
        modified,
        readonly,
        line_num,
        total_lines,
        percentage,
        get_git_branch()
    )

    print(msg)
end)

----- EDITING
vim.keymap.set("v", "$", "$<left>")
vim.keymap.set("v", "w", "e")
vim.keymap.set("v", "<C-c>", '"+y')
vim.keymap.set({ "n", "v" }, "0", function()
    local first_non_blank = vim.fn.match(vim.fn.getline("."), "\\S") + 1
    if vim.fn.col(".") == first_non_blank then
        return "0"
    else
        return "^zH"
    end
end, { expr = true, desc = "Smart zero: toggle between ^ and 0" })
vim.keymap.set("n", "<leader>u", require("undotree").open)

----- SESSION BUFFER CONTROLLER
local session_file = function() -- ~/.vim/sessions/<current dir name>.vim
    return "~/.vim/sessions/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t") .. ".vim"
end

local ask_save_session = function(without_confirm)
    vim.api.nvim_input(":wa<CR>")
    local save_cmd = ":mksession! " .. session_file() .. "<left><left><left><left>"
    if without_confirm then
        save_cmd = save_cmd .. "<CR>"
    end
    vim.api.nvim_input(save_cmd)
end

local ask_load_session = function()
    vim.api.nvim_input(":source " .. session_file() .. "<left><left><left><left>")
end

vim.keymap.set("n", "<M-o>", ask_load_session)
vim.keymap.set("n", "<M-s>", ask_save_session)

----- CD TO CURRENT BUFFER's DIR | lcd -> for cding the current buffer only to the current dir
vim.keymap.set("n", "<localleader>cd", ":cd %:p:h<CR>")
vim.keymap.set("n", "<localleader>lcd", ":lcd %:p:h<CR>")

----- COPY CURRENT RELATIVE PATH
vim.keymap.set("n", "y%", function()
    local path = vim.fn.expand("%:.")
    vim.fn.setreg("+", path)
    vim.notify("Copied relative path: " .. path)
end, { desc = "Copy relative file path" })
