return {
	cmd = { "deno", "lsp" },
	root_dir = vim.fs.root(0, { "deno.json" }), -- detect Deno project
	init_options = {
		lint = true, -- enable linting
	},
	settings = {},
}
