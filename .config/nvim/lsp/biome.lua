---@type vim.lsp.Config
return {
	single_file_support = true,
	cmd = { "biome", "lsp-proxy" },
	root_markers = { "biome.json" },
}
