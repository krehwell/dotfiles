---@type vim.lsp.Config
return {
	cmd = { "cssmodules-language-server" },
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	init_options = { camelCase = true },
}
