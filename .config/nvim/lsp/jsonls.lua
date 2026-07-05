---@type vim.lsp.Config
return {
    cmd = { "vscode-json-language-server", "--stdio" },
    filetypes = { "json", "jsonc" },
    root_markers = { "package.json", ".git" },
    settings = {
        json = {
            validate = { enable = true },
        },
    },
}
