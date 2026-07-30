---@type vim.lsp.Config
return {
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    cmd = { "tsgo", "--lsp", "--stdio" },
    root_dir = function(bufnr, on_dir)
        local fname = vim.api.nvim_buf_get_name(bufnr)
        if vim.fs.root(fname, { "deno.json", "deno.jsonc" }) then
            return -- Deno project: let denols handle it instead
        end
        local root_markers = { { "package-lock.json", "yarn.lock", "pnpm-lock.yaml" }, { ".git" } }
        local project_root = vim.fs.root(bufnr, root_markers) or vim.fn.getcwd()
        on_dir(project_root)
    end,
    on_init = function(client)
        -- semanticTokensProvider is stripped for every client in lsp-utils on_attach
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        client.server_capabilities.codeLensProvider = nil
        client.server_capabilities.documentHighlightProvider = false
    end,
}
