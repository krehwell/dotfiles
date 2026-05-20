---@type vim.lsp.Config
return {
	cmd = { "deno", "lsp" },
	filetypes = {},
	root_markers = { "deno.json", "deno.jsonc" },
	init_options = {
		lint = true,
	},
}
