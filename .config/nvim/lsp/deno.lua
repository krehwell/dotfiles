---@type vim.lsp.Config
return {
	cmd = { "deno", "lsp" },
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	root_markers = { "deno.json", "deno.jsonc" },
	init_options = {
		lint = true,
	},
}
