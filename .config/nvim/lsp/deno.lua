---@type vim.lsp.Config
return {
    cmd = { "deno", "lsp" },
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    root_dir = function(bufnr, on_dir)
        local root = require("lsp-utils").deno_root(bufnr)
        if root then on_dir(root) end
    end,
    init_options = {
        lint = true,
    },
}
