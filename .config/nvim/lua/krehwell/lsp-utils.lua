local on_attach = function(bufnr)
	local opts = { buffer = bufnr, remap = false, silent = true }

	-- DIAGNOSTIC JUMP KEYMAPS
	-- LSP WITH FZF
	vim.keymap.set("n", "gd", ":lua require('fzf-lua').lsp_definitions({ jump1 = true })<cr>", opts)
	vim.keymap.set("n", "gD", ":lua require('fzf-lua').lsp_declaration({ jump1 = true })<cr>", opts)
	vim.keymap.set("n", "gri", ":lua require('fzf-lua').lsp_implementations({ jump1 = true })<cr>", opts)
	vim.keymap.set("n", "gy", ":lua require('fzf-lua').lsp_typedefs({ jump1 = true })<cr>", opts)
	vim.keymap.set("n", "grr", ":lua require('fzf-lua').lsp_references({ ignore_current_line = true })<cr>", opts)
	vim.keymap.set("n", "gO", ":lua require('fzf-lua').lsp_document_symbol()s<cr>", opts)
	vim.keymap.set("n", "ge", ":lua vim.diagnostic.open_float(nil, { focus=false, scope='cursor' })<cr>", opts)
	vim.keymap.set("n", "gra", "<cmd>FzfLua lsp_code_actions<cr>", opts)
	vim.keymap.set("n", "grn", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "gq", ":lua vim.lsp.buf.format()<CR>", opts)
	vim.keymap.set("v", "gq", function()
		vim.lsp.buf.format({
			range = { ["start"] = vim.api.nvim_buf_get_mark(0, "<"), ["end"] = vim.api.nvim_buf_get_mark(0, ">") },
		})
	end, opts)
end

local diagnostic_config = {
	show_diagnostic_autocmds = { "InsertLeave", "TextChanged" },
	virtual_text = true,
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
