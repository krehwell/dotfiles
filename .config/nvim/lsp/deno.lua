---@type vim.lsp.Config
return {
	cmd = { "deno", "lsp" },
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	root_dir = function(bufnr, on_dir)
		local fname = vim.api.nvim_buf_get_name(bufnr)
		local deno_root = vim.fs.root(fname, { "deno.json", "deno.jsonc" })
		-- Only attach in actual Deno projects; otherwise stay off so tsgo handles it.
		if deno_root then
			on_dir(deno_root)
		end
	end,
	init_options = {
		lint = true,
	},
}
