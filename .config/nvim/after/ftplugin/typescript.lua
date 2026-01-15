local function console_format()
	vim.cmd("normal! viwy")
	vim.cmd("normal! o")
	vim.cmd("normal! a console.log()")
	vim.cmd("normal! P")
	vim.cmd("normal! ==")
end

vim.keymap.set("n", "<leader><leader>", console_format, { noremap = true, silent = true, buffer = true })
vim.keymap.set("n", "[[", function()
	-- try to find a hook function (starts with "use")
	local hook_pattern = "use%A"

	local hook_found = vim.fn.search(hook_pattern, "cW")

	if hook_found == 0 then
		local patterns = {
			"function \\h\\w*", -- function name()
			"const \\h\\w*\\s*=", -- const name =
		}

		for _, pattern in ipairs(patterns) do
			if vim.fn.search(pattern, "bcW") > 0 then
				return
			end
		end

		vim.cmd("normal! ?\\(function\\|const\\)\\s*\\h\\w*<CR>")
	end
	vim.cmd("noh | normal! ww")
end, { buffer = true, silent = true })
