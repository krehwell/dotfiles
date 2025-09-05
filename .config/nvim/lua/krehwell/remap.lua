vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

--- BASIC MAPPING
vim.keymap.set("n", "<Leader>-", ":vertical resize -23<CR>")
vim.keymap.set("n", "<Leader>=", ":vertical resize +23<CR>")
vim.keymap.set({ "i", "s", "n" }, "<esc>", function()
	if require("luasnip").expand_or_jumpable() then
		require("luasnip").unlink_current()
	end
	vim.cmd("noh")
	return "<esc>"
end, { desc = "Escape, clear hlsearch, and stop snippet session", expr = true })


-- NORMALIZE THE INDENTATION SO IT STARTS FROM THE LEFTMOST POSITION (NO LEADING SPACES).
-- vim.keymap.set("x", "a", function()
--     -- Get the selected range
--     local start_line = vim.fn.line("'<")
--     local end_line = vim.fn.line("'>")
--
--     -- Get all selected lines
--     local lines = {}
--     for line_num = start_line, end_line do
--         table.insert(lines, vim.fn.getline(line_num))
--     end
--
--     -- Find the minimum indentation (excluding empty lines)
--     local min_indent = math.huge
--     for _, line in ipairs(lines) do
--         if line:match("%S") then -- line has non-whitespace content
--             local indent = line:match("^%s*"):len()
--             min_indent = math.min(min_indent, indent)
--         end
--     end
--
--     -- If we found any indentation, remove it from all lines
--     if min_indent > 0 and min_indent ~= math.huge then
--         for i, line in ipairs(lines) do
--             if line:match("%S") then -- only modify non-empty lines
--                 lines[i] = line:sub(min_indent + 1)
--             end
--         end
--
--         -- Replace the lines in the buffer
--         for i, line in ipairs(lines) do
--             vim.fn.setline(start_line + i - 1, line)
--         end
--     end
-- end, { desc = "Remove common leading whitespace from selection" })


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

----- SESSION BUFFER CONTROLLER
local ask_save_session = function(without_confirm)
	local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":t") -- get name of current dir only
	vim.api.nvim_input(":wa<CR>")
	local save_cmd = ":mksession! ~/.vim/session/" .. cwd .. ".vim<left><left><left><left>"
	if without_confirm then
		save_cmd = save_cmd .. "<CR>"
	end
	vim.api.nvim_input(save_cmd)
end

local ask_load_session = function()
	local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
	vim.api.nvim_input(":source ~/.vim/session/" .. cwd .. ".vim<left><left><left><left>")
end

vim.keymap.set("n", "<M-o>", ask_load_session)
vim.keymap.set("n", "<M-s>", ask_save_session)
vim.keymap.set("n", "<localleader>o", ask_load_session)
vim.keymap.set("n", "<localleader>s", ask_save_session)

----- CD TO CURRENT BUFFER's DIR | lcd -> for cding the current buffer only to the current dir
vim.keymap.set("n", "<localleader>cd", ":cd %:p:h<CR>")
vim.keymap.set("n", "<localleader>lcd", ":lcd %:p:h<CR>")
