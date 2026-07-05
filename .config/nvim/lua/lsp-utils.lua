local on_attach = function(bufnr, client)
    local opts = { buffer = bufnr, remap = false, silent = true }

    -- I don't want lsp syntax highlight.  rely all from ts insteead
    if client and client.server_capabilities then client.server_capabilities.semanticTokensProvider = nil end

    local lsp_maps = {
        { "gd", "lsp_definitions", { jump1 = true } },
        { "gD", "lsp_declarations", { jump1 = true } },
        { "g#", "lsp_live_workspace_symbols", {} },
        { "gri", "lsp_implementations", { jump1 = true } },
        { "grt", "lsp_typedefs", { jump1 = true } },
        { "grr", "lsp_references", { ignore_current_line = true } },
        { "gO", "lsp_document_symbols", {} }, -- document symbols
        { "gra", "lsp_code_actions", {} },
    }
    for _, m in ipairs(lsp_maps) do
        vim.keymap.set("n", m[1], function() require("fzf-lua")[m[2]](m[3]) end, opts)
    end

    vim.keymap.set("n", "grn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "ge", function() vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" }) end, opts)

    -- DIAGNOSTIC JUMPS
    local err = vim.diagnostic.severity.ERROR
    local diag_jumps = {
        { "[d", { count = -1 }, "Previous diagnostic" },
        { "]d", { count = 1 }, "Next diagnostic" },
        { "[e", { count = -1, severity = err }, "Previous error" },
        { "]e", { count = 1, severity = err }, "Next error" },
    }
    for _, j in ipairs(diag_jumps) do
        vim.keymap.set("n", j[1], function() vim.diagnostic.jump(j[2]) end, { desc = j[3] })
    end
end

local diagnostic_config = {
    show_diagnostic_autocmds = { "InsertLeave", "TextChanged", "BufEnter", "WinEnter" },
    virtual_text = true,
    update_in_insert = false,
    signs = false,
    underline = true,
    severity_sort = true,
    float = {
        focusable = true,
        source = "always",
        show_header = true,
        header = "",
        border = "rounded",
        style = "minimal",
        prefix = "",
    },
}

return { on_attach = on_attach, diagnostic_config = diagnostic_config }
