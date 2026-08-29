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
        if require("lsp-utils").deno_root(bufnr) then return end
        local root = vim.fs.root(bufnr, { "biome.json", "biome.jsonc" })
        if root then on_dir(root) end
    end,
}
