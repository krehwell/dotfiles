---@type vim.lsp.Config
return {
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    cmd = { "tsgo", "--lsp", "--stdio" },
    root_dir = function(bufnr, on_dir)
        if require("lsp-utils").deno_root(bufnr) then return end
        local root_markers = { { "package-lock.json", "yarn.lock", "pnpm-lock.yaml" }, { ".git" } }
        on_dir(vim.fs.root(bufnr, root_markers) or vim.fn.getcwd())
    end,
    on_init = function(client)
        -- semanticTokensProvider is stripped for every client in lsp-utils on_attach
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        client.server_capabilities.codeLensProvider = nil
        client.server_capabilities.documentHighlightProvider = false
    end,
}
