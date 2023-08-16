local on_attach = function(client, bufnr)
	local opts = { buffer = bufnr, remap = false, silent = true }

	vim.cmd([[
      " I don't want to be diagnostic-nified while typing
      " autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, { focus=false })
      autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focus=false, scope="cursor" })
  ]])
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
	-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	-- vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, opts)
	-- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "gd", ":lua require('fzf-lua').lsp_definitions({ jump_to_single_result = true })<cr>", opts)
	vim.keymap.set("n", "gi", ":lua require('fzf-lua').lsp_implementations({ jump_to_single_result = true })<cr>", opts)
	vim.keymap.set("n", "gy", ":lua require('fzf-lua').lsp_typedefs({ jump_to_single_result = true })<cr>", opts)
	vim.keymap.set("n", "gr", ":lua require('fzf-lua').lsp_references({ ignore_current_line = true })<cr>", opts)
	vim.keymap.set("n", "K", function()
		vim.api.nvim_command("set eventignore=CursorHold")
		vim.lsp.buf.hover()
		vim.api.nvim_command('autocmd CursorMoved <buffer> ++once set eventignore=""')
	end, opts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
	vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)
	vim.keymap.set("n", "<f2>", vim.lsp.buf.rename, opts)
	-- vim.keymap.set("n", "ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "ca", "<cmd>FzfLua lsp_code_actions<cr>", opts)
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
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
}

return {
	on_attach = on_attach,
	diagnostic_config = diagnostic_config,
}
