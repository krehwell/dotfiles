return {
	"nvimtools/none-ls.nvim",
	dependencies = { "nvimtools/none-ls-extras.nvim" },
	event = "LspAttach",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			debug = false,
			sources = {
				-- COMMON
				null_ls.builtins.formatting.stylua.with({
					indent_type = "Spaces",
					collapse_simple_statement = "Always",
				}),

				-- DOCKER
				null_ls.builtins.diagnostics.hadolint,

				-- GO
				null_ls.builtins.formatting.goimports,
				null_ls.builtins.formatting.golines,
				null_ls.builtins.formatting.goimports_reviser,
				-- null_ls.builtins.formatting.gofumpt.with({ space = true, }),

				-- TS
				null_ls.builtins.formatting.prettierd,
				-- require("none-ls.code_actions.eslint_d"),
				-- require("none-ls.diagnostics.eslint_d"),
				require("none-ls.code_actions.eslint"),
				require("none-ls.diagnostics.eslint"),
				-- null_ls.builtins.diagnostics.dotenv_linter,

				-- CSpell
				-- null_ls.builtins.diagnostics.cspell.with({ }),
				-- null_ls.builtins.completion.spell,
				-- null_ls.builtins.code_actions.cspell,

				null_ls.builtins.formatting.protolint,

				-- null_ls.builtins.code_actions.gitsigns,
			},
		})
	end,
}
