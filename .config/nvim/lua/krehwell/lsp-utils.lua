local please_remind_me_lsp = function()
	print("IF YOU RENAMING/UPDATING THINGS, PLEASE MAKE SURE YOU UPDATE THE APP/MOBILE AS WELL!!!")
end

local on_attach = function(bufnr)
	local opts = { buffer = bufnr, remap = false, silent = true }

	-- DIAGNOSTIC JUMP KEYMAPS
	-- LSP WITH FZF
	vim.keymap.set("n", "gd", function()
		please_remind_me_lsp()
		require("fzf-lua").lsp_definitions({ jump1 = true })
	end, opts)
	vim.keymap.set("n", "gD", function()
		please_remind_me_lsp()
		require("fzf-lua").lsp_declarations({ jump1 = true })
	end, opts)
	vim.keymap.set("n", "g#", function()
		please_remind_me_lsp()
		require("fzf-lua").lsp_live_workspace_symbols()
	end, opts)
	vim.keymap.set("n", "gri", function()
		please_remind_me_lsp()
		require("fzf-lua").lsp_implementations({ jump1 = true })
	end, opts)
	vim.keymap.set("n", "gy", function()
		please_remind_me_lsp()
		require("fzf-lua").lsp_typedefs({ jump1 = true })
	end, opts)
	vim.keymap.set("n", "grr", function()
		please_remind_me_lsp()
		require("fzf-lua").lsp_references({ ignore_current_line = true })
	end, opts)
	vim.keymap.set("n", "gO", function()
		please_remind_me_lsp()
		require("fzf-lua").lsp_document_symbols()
	end, opts)
	vim.keymap.set("n", "ge", function()
		vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
	end, opts)
	vim.keymap.set("n", "gra", function()
		please_remind_me_lsp()
		require("fzf-lua").lsp_code_actions()
	end, opts)
	vim.keymap.set("n", "grn", function()
		please_remind_me_lsp()
		vim.lsp.buf.rename()
	end, opts)

	-- FORMATTING
	vim.keymap.set("n", "<leader>gq", ":lua vim.lsp.buf.format()<CR>", opts)
	-- format like this does not lose the jumplist
	vim.keymap.set("n", "gq", function()
		local cur_line = vim.api.nvim_win_get_cursor(0)[1]
		local start_line = math.max(cur_line - 2, 1)
		local end_line = cur_line + 2
		vim.lsp.buf.format({
			range = {
				["start"] = { start_line, 0 },
				["end"] = { end_line, 0 },
			},
		})
	end, opts)
	vim.keymap.set("v", "gq", function()
		vim.lsp.buf.format({
			range = { ["start"] = vim.api.nvim_buf_get_mark(0, "<"), ["end"] = vim.api.nvim_buf_get_mark(0, ">") },
		})
	end, opts)

	vim.keymap.set("n", "[d", function()
		vim.diagnostic.jump({ count = -1 })
	end, { desc = "Previous diagnostic" })
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.jump({ count = 1 })
	end, { desc = "Next diagnostic" })
	vim.keymap.set("n", "[e", function()
		vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR })
	end, { desc = "Previous error" })
	vim.keymap.set("n", "]e", function()
		vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR })
	end, { desc = "Next error" })
end

local diagnostic_config = {
	show_diagnostic_autocmds = {
		"InsertLeave",
		-- "TextChanged"
	},
	virtual_text = true,
	update_in_insert = true,
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

local fts = {
	"lua",
	"typescript",
	"javascript",
	"typescriptreact",
	"javascriptreact",
	"vim",
	"cpp",
	"go",
	"c",
	"sh",
	"css",
	"html",
	"vimdoc",
	"json",
	"md",
	"jsonc",
}

return {
	on_attach = on_attach,
	diagnostic_config = diagnostic_config,
	fts = fts,
}
