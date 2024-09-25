return {
	"pmizio/typescript-tools.nvim",
	ft = { "typescript", "typescriptreact", "javascript" },
	enabled = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"neovim/nvim-lspconfig",
		{ "dmmulroy/ts-error-translator.nvim", event = "LspAttach", ft = { "typescript", "typescriptreact" } },
	},
	keys = {
		{ "<leader>ts", ":TSTools", desc = "TSTools options" },
	},
	opts = {
		settings = {
			tsserver_file_preferences = {
				autoImportFileExcludePatterns = { "**/@mui/**" },
				importModuleSpecifierPreference = "auto",
				lazyConfiguredProjectsFromExternalProject = true,
			},
		},
	},
}
