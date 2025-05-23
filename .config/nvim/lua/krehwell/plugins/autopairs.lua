return {
	"echasnovski/mini.pairs",
	dependencies = {
		{ "windwp/nvim-ts-autotag" },
	},
	version = false,
	event = "InsertEnter",
	config = function()
		require("mini.pairs").setup({})
		require("nvim-ts-autotag").setup({
			opts = {
				enable_close = true,
				enable_rename = true,
				enable_close_on_slash = false,
			},
		})

		vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			underline = true,
			virtual_text = {
				spacing = 5,
				severity_limit = "Warning",
			},
			update_in_insert = true,
		})
	end,
}
