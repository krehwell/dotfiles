local dim_my_highlights = function()
	vim.api.nvim_set_hl(0, "NoSyntaxColoring", { fg = "NvimLightGray2" })
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalNC", { link = "Normal" })

	-- turnoff all syntax colors
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
	-- vim.api.nvim_set_hl(0, "Statement", { link = "NoSyntaxColoring" })
	-- vim.api.nvim_set_hl(0, "Conditional", { link = "NoSyntaxColoring" })
	-- vim.api.nvim_set_hl(0, "Repeat", { link = "NoSyntaxColoring" })
	-- vim.api.nvim_set_hl(0, "PreCondit", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "Label", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "Keyword", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "Exception", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "PreProc", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "Include", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "Define", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "Macro", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "Type", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "StorageClass", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "Structure", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "Typedef", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "Special", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "DiagnosticUnnecessary", { link = "Comment" })

	vim.api.nvim_set_hl(0, "TSAnnotation", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSAttribute", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSBoolean", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSCharacter", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSConstructor", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSConstant", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSConstMacro", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSException", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSField", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSFloat", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSFunction", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSFuncMacro", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSInclude", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSKeyword", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSKeywordFunction", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSKeywordOperator", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSLabel", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSMethod", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSNamespace", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSNone", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSNumber", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSOperator", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSParameter", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSProperty", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSPunctBracket", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSPunctSpecial", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSPunctDelimiter", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSString", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSSymbol", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSTag", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSTagDelimiter", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSText", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSTitle", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSLiteral", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSType", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSVariable", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSConstBuiltin", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSFuncBuiltin", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSTypeBuiltin", { link = "NoSyntaxColoring" })
	vim.api.nvim_set_hl(0, "TSVariableBuiltin", { link = "NoSyntaxColoring" })
	-- vim.api.nvim_set_hl(0, "TSConditional", { link = "NoSyntaxColoring" })
	-- vim.api.nvim_set_hl(0, "TSError", { link = "NoSyntaxColoring" })
	-- vim.api.nvim_set_hl(0, "TSRepeat", { link = "NoSyntaxColoring" })
	-- vim.api.nvim_set_hl(0, "TSStringRegex", { link = "NoSyntaxColoring" })
	-- vim.api.nvim_set_hl(0, "TSStringEscape", { link = "NoSyntaxColoring" })
	-- vim.api.nvim_set_hl(0, "TSEmphasis", { link = "NoSyntaxColoring" })
	-- vim.api.nvim_set_hl(0, "TSComment", { link = "NoSyntaxColoring" })
	-- vim.api.nvim_set_hl(0, "TSUnderline", { link = "NoSyntaxColoring" })
	-- vim.api.nvim_set_hl(0, "TSURI", { link = "NoSyntaxColoring" })
	-- vim.api.nvim_set_hl(0, "TSDefinition", { link = "MatchParen" })
	-- vim.api.nvim_set_hl(0, "TSDefinitionUsage", { link = "MatchParen" })
	-- vim.api.nvim_set_hl(0, "TSStrike", { link = "NoSyntaxColoring" })

	vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "MatchParen" })
	vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "MatchParen" })
	vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "MatchParen" })
end

local sanity_tab_color = function()
	vim.api.nvim_set_hl(0, "TabLineSel", { link = "DiffText" })
	vim.api.nvim_set_hl(0, "TabLine", { link = "Conceal" })
	vim.api.nvim_set_hl(0, "TabLineFill", { link = "Conceal" })
	vim.api.nvim_set_hl(0, "WinSeparator", { link = "Conceal" })
end

return {
	"lengarvey/base16-vim",
	priority = 1000,
	dependencies = {
		-- BEAUTIFY
		{ "DaikyXendo/nvim-material-icon", event = "BufReadPre" },
		{ "j-hui/fidget.nvim", event = "LspAttach", opts = { notification = { window = { winblend = 0 } } } },
	},
	config = function()
		vim.api.nvim_create_autocmd({ "VimEnter" }, {
			group = vim.api.nvim_create_augroup("krehwell/dim_my_highlights", { clear = true }),
			desc = "I don't like colorscheme, turn off all highlighting",
			callback = dim_my_highlights,
		})


		vim.api.nvim_create_autocmd({ "VimEnter" }, {
			group = vim.api.nvim_create_augroup("krehwell/sanity_tab_color", { clear = true }),
			desc = "make sense tab color",
			callback = sanity_tab_color,
		})

		vim.cmd([[ colorscheme default ]])
	end,
}
