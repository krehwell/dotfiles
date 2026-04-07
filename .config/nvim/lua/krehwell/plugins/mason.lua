return {
	"williamboman/mason.nvim",
	cmd = { "Mason" },
	dependencies = {
		{ "RRethy/vim-illuminate" },
	},
	ft = { "*" },
	opts = {
		ensure_installed = {
			"biome",
			"css_variables",
			"cssls",
			"cssmodules_ls",
			"denols",
			"gopls",
			"html",
			"jsonls",
			"tsgo",
		},
	},
	config = function(_, opts)
		require("mason").setup({ opts })

		local servers = vim.iter(vim.api.nvim_get_runtime_file("lsp/*.lua", true))
			:map(function(file)
				return vim.fn.fnamemodify(file, ":t:r")
			end)
			:totable()
		vim.lsp.enable(servers)

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("krehwell/lsp_configure", { clear = true }),
			desc = "LSP Setup",
			callback = function(event)
				local lsp_utils = require("krehwell.lsp-utils")
				vim.diagnostic.config(lsp_utils.diagnostic_config)
				lsp_utils.on_attach(event.buf)
			end,
		})
	end,
}
