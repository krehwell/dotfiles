local isMasonLspconfigPresent, masonLspconfig = pcall(require, "mason-lspconfig")
local isMasonPresent, mason = pcall(require, "mason")
if not isMasonPresent or not isMasonLspconfigPresent then
	return
end

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

masonLspconfig.setup({
	automatic_installation = true,
	ensure_installed = {
		"tsserver",
		"sumneko_lua",
		"gopls",
		"cssls",
		"html",
		"cssmodules_ls",
	},
})
