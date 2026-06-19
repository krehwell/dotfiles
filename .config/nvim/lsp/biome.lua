---@type vim.lsp.Config
return {
    cmd = { "biome", "lsp-proxy" },
    filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "json",
        "jsonc",
    },
    root_dir = function(bufnr, on_dir)
        local fname = vim.api.nvim_buf_get_name(bufnr)
        if vim.fs.root(fname, { "deno.json", "deno.jsonc" }) then
            return -- Deno project: let denols handle it
        end
        local root = vim.fs.root(fname, { "biome.json", "biome.jsonc" })
        if root then on_dir(root) end
    end,
}
