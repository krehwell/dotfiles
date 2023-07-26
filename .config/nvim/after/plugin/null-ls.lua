local present, null_ls = pcall(require, "null-ls")
if not present then
	return
end

null_ls.setup({
	debug = false,
	sources = {
		-- COMMON
		null_ls.builtins.formatting.stylua.with({
			indent_type = "Spaces",
			collapse_simple_statement = "Always",
		}),
		null_ls.builtins.code_actions.gitsigns,

		-- DOCKER
		null_ls.builtins.diagnostics.hadolint,

		-- GO
		null_ls.builtins.formatting.goimports,
		null_ls.builtins.formatting.golines,
		-- null_ls.builtins.formatting.gofumpt.with({ space = true, }),
		null_ls.builtins.formatting.goimports_reviser,

		-- TS
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.diagnostics.eslint_d,
		null_ls.builtins.code_actions.eslint_d,
		-- null_ls.builtins.diagnostics.eslint,
		-- null_ls.builtins.code_actions.eslint,
		-- null_ls.builtins.diagnostics.dotenv_linter,

		-- CSpell
		-- null_ls.builtins.diagnostics.cspell.with({ }),
		-- null_ls.builtins.completion.spell,
		-- null_ls.builtins.code_actions.cspell,

		null_ls.builtins.formatting.protolint,
	},
})
