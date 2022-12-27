local on_attach = function(client, bufnr)
	local opts = { buffer = bufnr, remap = false, silent = true }

	vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, { focus=false })]])
	vim.keymap.set("n", "<leader>W", ":lua vim.diagnostic.goto_prev()<CR>", opts)
	vim.keymap.set("n", "<leader>w", ":lua vim.diagnostic.goto_next()<CR>", opts)
	vim.keymap.set(
		"n",
		"<leader>E",
		":lua vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })<CR>",
		opts
	)
	vim.keymap.set(
		"n",
		"<leader>e",
		":lua vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })<CR>",
		opts
	)
	-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, opts)
	-- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
	vim.keymap.set("n", "<f2>", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<space>f", ":lua vim.lsp.buf.format({async = true})<CR>", opts)
end

local diagnostic_config = {
	virtual_text = {
		-- prefix = '●'
	},
	update_in_insert = false,
	signs = true,
	underline = true,
	severity_sort = true,
	float = true,
}

return {
	on_attach = on_attach,
	diagnostic_config = diagnostic_config,
}
