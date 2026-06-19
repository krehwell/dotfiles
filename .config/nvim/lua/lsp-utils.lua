local please_remind_me_lsp = function()
    print("IF YOU RENAMING/UPDATING THINGS, PLEASE MAKE SURE YOU UPDATE THE APP/MOBILE AS WELL!!!")
end

local on_attach = function(bufnr)
    local opts = { buffer = bufnr, remap = false, silent = true }

    -- LSP PICKERS (snacks) — each reminds first, then opens the picker. snacks
    -- defaults: auto_confirm (jump straight on a single result) + tagstack push.
    local lsp_maps = {
        { "gd", "lsp_definitions" },
        { "gD", "lsp_declarations" },
        { "g#", "lsp_workspace_symbols" },
        { "gri", "lsp_implementations" },
        { "grt", "lsp_type_definitions" },
        { "grr", "lsp_references" },
        { "gO", "lsp_symbols" }, -- document symbols
    }
    for _, m in ipairs(lsp_maps) do
        vim.keymap.set("n", m[1], function()
            please_remind_me_lsp()
            require("snacks").picker[m[2]]()
        end, opts)
    end

    -- code actions: snacks has no picker; ui_select routes it through snacks.
    vim.keymap.set("n", "gra", function()
        please_remind_me_lsp()
        require("snacks") -- ensure ui_select handler is installed
        vim.lsp.buf.code_action()
    end, opts)

    vim.keymap.set("n", "grn", function()
        please_remind_me_lsp()
        vim.lsp.buf.rename()
    end, opts)
    vim.keymap.set("n", "ge", function()
        vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
    end, opts)

    -- DIAGNOSTIC JUMPS
    local err = vim.diagnostic.severity.ERROR
    local diag_jumps = {
        { "[d", { count = -1 }, "Previous diagnostic" },
        { "]d", { count = 1 }, "Next diagnostic" },
        { "[e", { count = -1, severity = err }, "Previous error" },
        { "]e", { count = 1, severity = err }, "Next error" },
    }
    for _, j in ipairs(diag_jumps) do
        vim.keymap.set("n", j[1], function()
            vim.diagnostic.jump(j[2])
        end, { desc = j[3] })
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
