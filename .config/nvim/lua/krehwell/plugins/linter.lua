return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	event = "LspAttach",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			update_in_insert = false,
			sources = {
				-- LUA
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
				null_ls.builtins.formatting.biome.with({
					condition = function(utils)
						return utils.root_has_file({ "package.json" })
					end,
				}),
				-- null_ls.builtins.diagnostics.biome,

				null_ls.builtins.diagnostics.dotenv_linter,
			},
		})
	end,
}
