local on_attach = function(client, bufnr)
	local opts = { buffer = bufnr, remap = false, silent = true }

  -- DIAGNOSTIC JUMP KEYMAPS
	vim.cmd([[
      " I don't want to be diagnostic-nified while typing
      " autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, { focus=false })
      autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focus=false, scope="cursor" })
  ]])
	vim.keymap.set("n", "[W", ":lua vim.diagnostic.goto_prev()<CR>", opts)
	vim.keymap.set("n", "]w", ":lua vim.diagnostic.goto_next()<CR>", opts)
	vim.keymap.set("n", "[e", ":lua vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })<CR>", opts)
	vim.keymap.set("n", "]e", ":lua vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })<CR>", opts)

	-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

  -- LSP WITH NVIM DEFAULT
	-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	-- vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, opts)
	-- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

  -- LSP WITH FZF
	vim.keymap.set("n", "gd", ":lua require('fzf-lua').lsp_definitions({ jump_to_single_result = true })<cr>", opts)
	vim.keymap.set("n", "gi", ":lua require('fzf-lua').lsp_implementations({ jump_to_single_result = true })<cr>", opts)
	vim.keymap.set("n", "gy", ":lua require('fzf-lua').lsp_typedefs({ jump_to_single_result = true })<cr>", opts)
	vim.keymap.set("n", "gr", ":lua require('fzf-lua').lsp_references({ ignore_current_line = true })<cr>", opts)

  -- LSP WITH TELESCOPE
	-- vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts)
	-- vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<cr>", opts)
	-- vim.keymap.set("n", "gy", "<cmd>Telescope lsp_type_definitions<cr>", opts)
	-- vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", opts)

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
	vim.keymap.set("n", "gq", ":lua vim.lsp.buf.format()<CR>", opts)
	vim.keymap.set("v", "gq", function()
		vim.lsp.buf.format({
      range = {
        ["start"] = vim.api.nvim_buf_get_mark(0, "<"),
        ["end"] = vim.api.nvim_buf_get_mark(0, ">"),
      },
    })
	end, opts)
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
		focusable = true,
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
