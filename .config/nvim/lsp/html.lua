---@type vim.lsp.Config
return {
	cmd = { "vscode-html-language-server", "--stdio" },
	filetypes = { "html" },
	embeddedLanguages = { css = true, javascript = true },
}
