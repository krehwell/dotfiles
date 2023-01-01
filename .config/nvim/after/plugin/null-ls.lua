local present, null_ls = pcall(require, "null-ls")
if not present then
	return
end

null_ls.setup({
	debug = false,
	sources = {
		null_ls.builtins.formatting.stylua.with({
			indent_type = "Spaces",
		}),
		null_ls.builtins.code_actions.gitsigns,

		null_ls.builtins.formatting.goimports,
		-- null_ls.builtins.formatting.gofmt,
		null_ls.builtins.formatting.gofumpt.with({
			space = true,
		}),
		null_ls.builtins.formatting.goimports_reviser,

		null_ls.builtins.formatting.prettierd,

		null_ls.builtins.diagnostics.eslint_d,
		null_ls.builtins.code_actions.eslint_d,

		-- null_ls.builtins.diagnostics.cspell.with({
		-- 	-- filetypes = { "html", "json", "yaml", "markdown", "*" },
		-- 	-- extra_filetypes = { "toml" },
		-- 	-- diagnostic_config = {
		-- 	-- 	-- see :help vim.diagnostic.config()
		-- 	-- 	underline = true,
		-- 	-- 	virtual_text = false,
		-- 	-- 	signs = true,
		-- 	-- 	update_in_insert = false,
		-- 	-- 	severity_sort = true,
		-- 	-- },
		-- 	timeout = 10000,
		-- 	disabled_filetypes = { "lua" },
		-- 	extra_args = { "-r", ".vim/", "-c", ".vim/cspell.json" },
		-- }),
		-- null_ls.builtins.completion.spell,
		-- null_ls.builtins.code_actions.cspell,

		null_ls.builtins.diagnostics.dotenv_linter,
	},
})
