return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
		"nvim-lua/plenary.nvim",
	},
	event = "LspAttach",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			update_in_insert = false,
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

				-- null_ls.builtins.formatting.biome.with({
				-- 	condition = function(utils)
				-- 		return utils.root_has_file({ "package.json" })
				-- 	end,
				-- }),
				-- null_ls.builtins.diagnostics.biome,

				-- TS
				-- null_ls.builtins.formatting.prettierd.with({
				-- 	condition = function(utils)
				-- 		return utils.root_has_file({ ".prettierrc", ".prettierrc.json", ".prettierrc.js" })
				-- 	end,
				-- }),
				-- require("none-ls.code_actions.eslint_d"),
				-- require("none-ls.diagnostics.eslint_d").with({
				-- 	-- method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
				-- 	condition = function(utils)
				-- 		return utils.root_has_file({ ".eslintrc.js", ".eslintrc.json", ".eslintrc.cjs" })
				-- 	end,
				-- 	diagnostic_config = { virtual_text = false },
				-- 	debounce = 350,
				-- }),
				-- require("none-ls.code_actions.eslint"),
				-- require("none-ls.diagnostics.eslint"),
				null_ls.builtins.diagnostics.dotenv_linter,
			},
		})
	end,
}
