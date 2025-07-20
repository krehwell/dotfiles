-- vim.cmd("syntax off")
vim.opt.termguicolors = true
-- vim.opt.background = "dark"

local dim_my_highlights = function()
	vim.api.nvim_set_hl(0, "CodeiumSuggestion", { fg = "#808080" })
	vim.api.nvim_set_hl(0, "NoSyntaxColoring", { fg = "#cecece" })
	vim.api.nvim_set_hl(0, "Module", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "Constant", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "String", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "Character", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "Number", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "Boolean", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "Float", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "Operator", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "Identifier", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "Function", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "Statement", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "Conditional", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "Repeat", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "Label", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "Keyword", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "Exception", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "PreProc", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "Include", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "Define", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "Macro", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "PreCondit", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "Type", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "StorageClass", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "Structure", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "Typedef", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "Special", { link = "NoSyntaxColoring" })
	-- vim.api.nvim_set_hl(0, "SpecialComment", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSConstructor", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSConditional", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSConstBuiltin", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSConstMacro", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSError", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSException", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSField", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSFunction", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSFuncBuiltin", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSFuncMacro", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSKeyword", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSKeywordFunction", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSLabel", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSMethod", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSNamespace", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSNone", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSParameter", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSParameterReference", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSProperty", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSPunctDelimiter", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSPunctBracket", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSPunctSpecial", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSRepeat", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSString", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSStringRegex", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSStringEscape", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSSymbol", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSType", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSTypeBuiltin", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSVariable", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSVariableBuiltin", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSTag", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSTagDelimiter", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSText", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "@constructor", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "@conditional", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "@constant.builtin", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "@constant.macro", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "@error", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "@exception", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "@field", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "@function", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "@function.builtin", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "@function.macro", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "@keyword", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "@keyword.function", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "@label", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "@method", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "@module", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "@namespace", { link = "NoSyntaxColoring" })
	-- vim.api.nvim_set_hl(0, "@none", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "@parameter", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "@parameter.reference", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "@property", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "@punctuation.delimiter", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "@punctuation.bracket", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "@punctuation.special", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "@repeat", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "@string", { link = "NoSyntaxColoring" })
	-- vim.api.nvim_set_hl(0, "@string.regex", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "@string.escape", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "@symbol", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "@type", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "@type.builtin", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "@variable", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "@variable.builtin", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "@AlabasterConstant", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "@AlabasterDefinition", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "@AlabasterPunct", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "@AlabasterString", { link = "NoSyntaxColoring" })
end

return {
	"p00f/alabaster.nvim",
	config = function()
		vim.g.alabaster_dim_comments = true
		vim.g.alabaster_floatborder = true
		vim.cmd([[ let &statusline='%#WinSeparator#' ]]) -- color the split window dashes

		vim.api.nvim_create_autocmd({ "BufEnter", "FileType", "BufLeave" }, {
			group = vim.api.nvim_create_augroup("krehwell/dim_my_highlights", { clear = true }),
			pattern = "*",
			desc = "Disable syntax highlighting",
			callback = function()
				dim_my_highlights()
			end,
		})

		vim.cmd([[
            " augroup diffcolors
            "     autocmd!
            "     autocmd Colorscheme * call s:SetDiffHighlights()
            " augroup END

            " function! s:SetDiffHighlights()
            "     if &background == "dark"
            "         highlight DiffAdd gui=bold guifg=none guibg=#2e4b2e
            "         highlight DiffDelete gui=bold guifg=none guibg=#4c1e15
            "         highlight DiffChange gui=bold guifg=none guibg=#45565c
            "         highlight DiffText gui=bold guifg=none guibg=#996d74
            "     else
            "         highlight DiffAdd gui=bold guifg=none guibg=palegreen
            "         highlight DiffDelete gui=bold guifg=none guibg=tomato
            "         highlight DiffChange gui=bold guifg=none guibg=lightblue
            "         highlight DiffText gui=bold guifg=none guibg=lightpink
            "     endif
            " endfunction
        ]])

		vim.cmd("colorscheme alabaster")
	end,
}
