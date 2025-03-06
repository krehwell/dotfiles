local on_attach = function(bufnr)
	local opts = { buffer = bufnr, remap = false, silent = true }

	-- DIAGNOSTIC JUMP KEYMAPS
	vim.cmd([[
	" I don't want to be diagnostic-nified while typing
	" autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, { focus=false })
	" autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focus=false, scope="cursor" })
	]])
	vim.keymap.set("n", "[w", ":lua vim.diagnostic.goto_prev()<CR>", opts)
	vim.keymap.set("n", "]w", ":lua vim.diagnostic.goto_next()<CR>", opts)
	vim.keymap.set("n", "[e", ":lua vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })<CR>", opts)
	vim.keymap.set("n", "]e", ":lua vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })<CR>", opts)

	-- LSP WITH FZF
	vim.keymap.set("n", "gd", ":lua require('fzf-lua').lsp_definitions({ jump1 = true })<cr>", opts)
	vim.keymap.set("n", "gD", ":lua require('fzf-lua').lsp_declaration({ jump1 = true })<cr>", opts)
	vim.keymap.set("n", "gi", ":lua require('fzf-lua').lsp_implementations({ jump1 = true })<cr>", opts)
	vim.keymap.set("n", "gy", ":lua require('fzf-lua').lsp_typedefs({ jump1 = true })<cr>", opts)
	vim.keymap.set("n", "gr", ":lua require('fzf-lua').lsp_references({ ignore_current_line = true })<cr>", opts)
	vim.keymap.set("n", "ge", ":lua vim.diagnostic.open_float(nil, { focus=false, scope='cursor' })<cr>", opts)
	vim.keymap.set("n", "gx", "<cmd>FzfLua lsp_code_actions<cr>", opts)

	-- LSP WITH NVIM DEFAULT
	-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	-- vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, opts)
	-- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	-- vim.keymap.set("n", "gx", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
	vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)
	vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
	vim.keymap.set("n", "K", function()
		vim.api.nvim_command("set eventignore=CursorHold")
		vim.lsp.buf.hover()
		vim.api.nvim_command('autocmd CursorMoved <buffer> ++once set eventignore=""')
	end, opts)
	vim.keymap.set("n", "<f2>", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "gq", ":lua vim.lsp.buf.format()<CR>", opts)
	vim.keymap.set("v", "gq", function()
		vim.lsp.buf.format({
			range = { ["start"] = vim.api.nvim_buf_get_mark(0, "<"), ["end"] = vim.api.nvim_buf_get_mark(0, ">") },
		})
	end, opts)
end

local diagnostic_config = {
	show_diagnostic_autocmds = { "InsertLeave", "TextChanged" },
	virtual_text = {
		-- prefix = '●'
	},
	update_in_insert = true,
	signs = false,
	underline = true,
	severity_sort = true,
	float = {
		focusable = true,
		source = "always",
		show_header = true,
		header = "",
		border = "rounded",
		style = "minimal",
		prefix = "",
		-- prefix = "",
	},
}

local fts = {
	"lua",
	"typescript",
	"javascript",
	"typescriptreact",
	"javascriptreact",
	"vim",
	"cpp",
	"go",
	"c",
	"sh",
	"css",
	"html",
	"vimdoc",
	"json",
	"md",
	"jsonc",
}

return {
	on_attach = on_attach,
	diagnostic_config = diagnostic_config,
	fts = fts,
}
