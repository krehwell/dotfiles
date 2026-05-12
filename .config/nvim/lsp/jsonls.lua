---@type vim.lsp.Config
return {
	cmd = { "vscode-json-language-server", "--stdio" },
	filetypes = { "json", "jsonc" },
	root_dir = vim.fs.root(0, { "package.json", ".git" }),
	settings = {
		json = {
			validate = { enable = true },
		},
	},
}
