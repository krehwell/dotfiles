return {
	"stevearc/conform.nvim",
	event = { "LspAttach" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettierd", "prettier" },
				typescript = { "prettierd", "prettier" },
				javascriptreact = { "prettierd", "prettier" },
				typescriptreact = { "prettierd", "prettier" },
				svelte = { "prettierd", "prettier" },
				css = { "prettierd", "prettier" },
				html = { "prettierd", "prettier" },
				json = { "prettierd", "prettier" },
				yaml = { "prettierd", "prettier" },
				markdown = { "prettierd", "prettier" },
				graphql = { "prettierd", "prettier" },
				lua = { "stylua" },
				go = { "goimports", "gofmt" },
				python = { "isort", "black" },
				["*"] = { "codespell" },
				["_"] = { "trim_whitespace" },
			},
		})
	end,
	keys = {
		{
			"gq",
			function()
				require("conform").format({ lsp_fallback = true, async = true })
			end,
			desc = "Format file or range (in visual mode)",
			mode = { "n", "v" },
		},
	},
}
