---@type vim.lsp.Config
return {
    cmd = { "tailwindcss-language-server", "--stdio" },
    root_markers = {
        "tailwind.config.js",
        "tailwind.config.ts",
        "tailwind.config.cjs",
        "tailwind.config.mjs",
        "postcss.config.js",
        "postcss.config.ts",
        "postcss.config.cjs",
        "postcss.config.mjs",
        "package.json",
        ".git",
    },
    filetypes = {
        -- html
        "html",
        -- css
        "css",
        "less",
        "sass",
        "scss",
        -- js
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        -- mixed
        "vue",
        "svelte",
        "templ",
    },
}
