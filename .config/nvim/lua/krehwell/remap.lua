-- Modes:
--   Normal       = "n"
--   Insert       = "i"
--   Visual       = "v"
--   Visual_Block = "x"
--   Terminal     = "t"
--   Command      = "c"
--
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

--- BASIC MAPPING
vim.keymap.set("n", "<Leader>-", ":vertical resize -23<CR>")
vim.keymap.set("n", "<Leader>=", ":vertical resize +23<CR>")
vim.keymap.set("n", "<esc>", "<esc>:noh<CR><esc>", { silent = true })
vim.keymap.set("i", "jj", "<c-o>:call search('}\\|)\\|]\\|>\\|\"', 'cW')<cr><Right>")

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

----- useful `[[`
-- vim.keymap.set("n", "[[", ":?{<CR>w99[{<CR>:noh<CR>", { silent = true })
-- vim.keymap.set("n", "][", ":/}<CR>b99]}<CR>:noh<CR>", { silent = true })
-- vim.keymap.set("n", "]]", ":j0[[%/{<CR><CR>:noh<CR>", { silent = true })
-- vim.keymap.set("n", "[]", ":k$][%?}<CR><CR>:noh<CR>", { silent = true })

----- EDITING
vim.keymap.set("n", "<M-j>", "ddp")
vim.keymap.set("n", "<M-k>", "ddkP")
vim.keymap.set("n", "<localleader>a", "ggVG")
vim.keymap.set("v", "$", "$<left>")
vim.keymap.set("v", "w", "e")
vim.keymap.set("v", "<C-c>", '"+y')
vim.keymap.set({ "n", "v" }, "0", function()
	local first_non_blank = vim.fn.match(vim.fn.getline("."), "\\S") + 1
	if vim.fn.col(".") == first_non_blank then
		return "0"
	else
		return "^"
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

vim.keymap.set("n", "<localleader>b", ":bprevious<CR>")
vim.keymap.set("n", "<localleader>n", ":bnext<CR>")
vim.keymap.set("n", "<M-o>", ask_load_session)
vim.keymap.set("n", "<M-s>", ask_save_session)
vim.keymap.set("n", "<localleader>o", ask_load_session)
vim.keymap.set("n", "<localleader>s", ask_save_session)

----- CD TO CURRENT BUFFER's DIR | lcd -> for cding the current buffer only to the current dir
vim.keymap.set("n", "<localleader>cd", ":cd %:p:h<CR>")
vim.keymap.set("n", "<localleader>lcd", ":lcd %:p:h<CR>")
