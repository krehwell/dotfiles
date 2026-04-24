return {
	filetypes = {},
	cmd = { "tsgo", "--lsp", "--stdio" },
	root_dir = function(bufnr, on_dir)
		local root_markers = { { "package-lock.json", "yarn.lock", "pnpm-lock.yaml" }, { ".git" } }
		local project_root = vim.fs.root(bufnr, root_markers) or vim.fn.getcwd() -- Fallback to the current working directory if no project root is found.
		on_dir(project_root)
	end,
	on_init = function(client)
		client.server_capabilities.semanticTokensProvider = nil
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
		client.server_capabilities.codeLensProvider = nil
		client.server_capabilities.documentHighlightProvider = false
	end,
}
