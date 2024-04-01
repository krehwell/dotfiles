return {
	"mfussenegger/nvim-lint",
	event = { "LspAttach" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			svelte = { "eslint_d" },
			python = { "pylint" },
			go = { "golangcilint" },
		}

		vim.cmd([[
            au BufWritePost * lua require('lint').try_lint()
        ]])
	end,
}
