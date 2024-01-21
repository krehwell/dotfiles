local M = {}

local color_utils = require("mirec/mirec_color_utils")

local colorscheme = {
	{ "Boolean", { ctermfg = 252 } },
	{ "Character", { ctermfg = 252 } },
	{ "ColorColumn", { ctermbg = 233 } },
	{ "Comment", { ctermfg = 8 } },
	{ "Conditional", { ctermfg = 252 } },
	{ "Conceal", { ctermfg = 8 } },
	{ "Constant", { ctermfg = 252 } },
	{ "Cursor", { ctermfg = 9, ctermbg = 192, cterm = { bold = false, nocombine = true } } },
	{ "CursorColumn", { ctermbg = 232 } },
	{ "CursorLine", { ctermbg = 233 } },
	{ "CursorLineNr", { ctermfg = 255, ctermbg = 125, cterm = { bold = false, nocombine = true } } },
	{ "CursorLineSign", { ctermfg = 255, ctermbg = 125, cterm = { bold = false, nocombine = true } } },
	{ "Debug", { ctermfg = 181, cterm = { bold = false } } },
	{ "Define", { ctermfg = 252, cterm = { bold = false } } },
	{ "Delimiter", { ctermfg = 252 } },
	{ "DiffAdd", { ctermbg = 22 } },
	{ "DiffChange", { ctermbg = 24 } },
	{ "DiffDelete", { ctermfg = 234, ctermbg = 88 } },
	{ "DiffText", { ctermfg = 231, ctermbg = 31, cterm = { bold = false } } },
	{ "Directory", { ctermfg = 231, cterm = { bold = false } } },
	{ "Error", { ctermfg = 231, ctermbg = 9 } },
	{ "ErrorMsg", { ctermfg = 16, ctermbg = 6 } },
	{ "Exception", { ctermfg = 252 } },
	{ "Float", { ctermfg = 252 } },
	{ "FoldColumn", { ctermfg = 181, ctermbg = 235 } },
	{ "Folded", { ctermfg = 181, ctermbg = 16 } },
	{ "Function", { ctermfg = 252 } },
	{ "Identifier", { ctermfg = 252 } },
	{ "phpMethodsVar", { ctermfg = 151 } },
	{ "Include", { ctermfg = 252 } },
	{ "IncSearch", { ctermfg = 16, ctermbg = 131 } },
	{ "Keyword", { ctermfg = 252 } },
	{ "Label", { ctermfg = 252 } },
	{ "LineNr", { ctermfg = 244, ctermbg = 234 } },
	{ "Macro", { ctermfg = 252 } },
	{ "MatchParen", { ctermfg = 255, cterm = { bold = false, nocombine = true } } },
	{ "ModeMsg", { ctermfg = 181, cterm = { bold = false } } },
	{ "MoreMsg", { ctermfg = 231, cterm = { bold = false } } },
	{ "NonText", { ctermfg = 8 } },
	{ "Normal", { ctermfg = 252 } },
	{ "Number", { ctermfg = 252 } },
	{ "Operator", { ctermfg = 252 } },

	{ "Pmenu", { ctermfg = 252, ctermbg = 235 } },
	{ "PmenuSel", { ctermfg = 16, ctermbg = 156 } },
	{ "PmenuSbar", { ctermfg = 248, ctermbg = 237 } },
	{ "PmenuThumb", { ctermfg = 248, ctermbg = 156 } },
	{ "PreCondit", { ctermfg = 252, cterm = { bold = false } } },
	{ "PreProc", { ctermfg = 252 } },
	{ "Question", { ctermfg = 231, cterm = { bold = false } } },
	{ "Repeat", { ctermfg = 252, cterm = { bold = false } } },
	{ "Search", { ctermfg = 227, ctermbg = 16, cterm = { bold = false, reverse = true } } },
	{ "SignColumn", { ctermfg = 244, ctermbg = 233 } },
	{ "SpecialChar", { ctermfg = 181, cterm = { bold = false } } },
	{ "SpecialComment", { ctermfg = 181, cterm = { bold = false } } },
	{ "Special", { ctermfg = 252 } },
	{ "SpecialKey", { ctermfg = 8 } },
	{ "SpellBad", { ctermfg = 174, ctermbg = 233, undercurl = true, cterm = { underline = true } } },
	{ "Statement", { ctermfg = 252 } },
	{ "doxygenBrief", { ctermfg = 249, cterm = { bold = false } } },
	{ "doxygenSpecialOnelineDesc", { ctermfg = 123 } },
	{ "StatusLine", { ctermbg = 16, ctermfg = 28, cterm = { bold = false } } },
	{ "StatusLineNC", { ctermfg = 234, ctermbg = 252 } },
	{ "StorageClass", { ctermfg = 252 } },
	{ "String", { ctermfg = 252 } },
	{ "Structure", { ctermfg = 252 } },
	{ "Tag", { ctermfg = 252 } },
	{ "Title", { ctermfg = 252 } },
	{ "Todo", { ctermfg = 231, cterm = { bold = true } } },
	{ "Typedef", { ctermfg = 252 } },
	{ "Type", { ctermfg = 252 } },
	{ "Underlined", { ctermfg = 81, cterm = { underline = true } } },
	{ "VertSplit", { ctermfg = 236, ctermbg = 16 } },
	{ "Visual", { ctermfg = 210, ctermbg = 236 } },
	{ "VisualNOS", { ctermfg = 234, ctermbg = 210, cterm = { bold = false, underline = true } } },
	{ "WarningMsg", { ctermfg = 231, ctermbg = 234, cterm = { bold = false } } },
	{ "WildMenu", { ctermfg = 16, ctermbg = 181 } },
	{ "Whitespace", { ctermfg = 242 } },

	{ "OverLength", { ctermbg = 237 } },
	{ "WarnLength", { ctermbg = 235 } },

	{ "BufferSelected", { ctermfg = 227, ctermbg = 16, cterm = { bold = false, reverse = true } } },
	{ "BufferNormal", { ctermfg = 252, ctermbg = 16 } },

	{ "QtObject", { ctermfg = 120 } },

	{ "outlTags", { ctermfg = 51 } },
	{ "OL1", { ctermfg = 231, ctermbg = 232, cterm = { bold = false, underline = true } } },
	{ "OL2", { ctermfg = 231, cterm = { bold = false } } },
	{ "OL3", { ctermfg = 228, cterm = { bold = false } } },
	{ "OL4", { ctermfg = 254 } },
	{ "OL5", { ctermfg = 189 } },
	{ "OL6", { ctermfg = 187 } },
	{ "OL7", { ctermfg = 146 } },
	{ "OL8", { ctermfg = 144 } },
	{ "OL9", { ctermfg = 103 } },

	{ "BT1", { ctermfg = 230 } },
	{ "BT2", { ctermfg = 230 } },
	{ "BT3", { ctermfg = 230 } },
	{ "PT1", { ctermfg = 196 } },
	{ "PT2", { ctermfg = 196 } },
	{ "PT3", { ctermfg = 196 } },
	{ "TA1", { ctermfg = 230 } },
	{ "TA2", { ctermfg = 230 } },
	{ "TA3", { ctermfg = 230 } },
	{ "UT1", { ctermfg = 196 } },
	{ "UT2", { ctermfg = 196 } },
	{ "UT3", { ctermfg = 196 } },
	{ "UB1", { ctermfg = 196 } },
	{ "UB2", { ctermfg = 196 } },
	{ "UB3", { ctermfg = 196 } },

	{ "@variable", {} },
	{ "@attribute", { link = "Attribute" } },
	{ "@property", { link = "Attribute" } },
	{ "@field", { link = "Attribute" } },

	{ "RegionMaker", { ctermfg = 235, ctermbg = 253 } },
	{ "diffFile", { link = "Conceal" } },
	{ "Attribute", { ctermfg = 252 } },
	{ "CallClass", { ctermfg = 252, cterm = { nocombine = true } } },
	{ "DefineClass", { ctermfg = 252 } },
	{ "CallStaticClass", { ctermfg = 252, cterm = { bold = false } } },
	{ "CallFunction", { ctermfg = 252 } },
	{ "CallPrivateFunction", { ctermfg = 252 } },
	{ "Self", { ctermfg = 252, cterm = { bold = false } } },

	{ "todoOkSymbol", { ctermfg = 34 } },
	{ "todoBadSymbol", { ctermfg = 196 } },
	{ "todoPartSymbol", { ctermfg = 191 } },
	{ "todoOk", { ctermfg = 241 } },
	{ "todoBad", { ctermfg = 227 } },
	{ "todoPart", { ctermfg = 136 } },

	{ "mailQuoted1", { ctermfg = 191 } },
	{ "mailQuoted2", { ctermfg = 94 } },
	{ "mailQuoted3", { ctermfg = 24 } },
	{ "mailQuoted4", { ctermfg = 88 } },

	{ "CmpItemMenu", { ctermfg = 120, cterm = { italic = true } } },

	{ "CmpItemAbbrMatch", { cterm = { bold = false }, ctermfg = 231 } },
	{ "CmpItemAbbrMatchFuzzy", { cterm = { bold = false }, ctermfg = 231 } },
	{ "CmpItemMenu", { cterm = { italic = true } } },
	{ "CmpItemAbbrDeprecated", { ctermfg = 244 } },

	{ "CmpItemKindField", { ctermfg = 255, ctermbg = 131 } },
	{ "CmpItemKindProperty", { ctermfg = 255, ctermbg = 131 } },
	{ "CmpItemKindEvent", { ctermfg = 255, ctermbg = 131 } },

	{ "CmpItemKindEnum", { ctermfg = 255, ctermbg = 28 } },
	{ "CmpItemKindKeyword", { ctermfg = 255, ctermbg = 28 } },

	{ "CmpItemKindConstant", { ctermfg = 255, ctermbg = 23 } },
	{ "CmpItemKindConstructor", { ctermfg = 255, ctermbg = 23 } },
	{ "CmpItemKindReference", { ctermfg = 255, ctermbg = 23 } },

	{ "CmpItemKindFunction", { ctermfg = 255, ctermbg = 90 } },

	{ "CmpItemKindStruct", { ctermfg = 255, ctermbg = 125 } },
	{ "CmpItemKindClass", { ctermfg = 255, ctermbg = 125 } },
	{ "CmpItemKindModule", { ctermfg = 255, ctermbg = 125 } },
	{ "CmpItemKindOperator", { ctermfg = 255, ctermbg = 125 } },

	{ "CmpItemKindVariable", { ctermfg = 255, ctermbg = 55 } },
	{ "CmpItemKindFile", { ctermfg = 255, ctermbg = 55 } },
	{ "CmpItemKindFolder", { ctermfg = 255, ctermbg = 55 } },
	{ "CmpItemKindSnippet", { ctermfg = 255, ctermbg = 55 } },

	{ "CmpItemKindUnit", { ctermfg = 255, ctermbg = 58 } },
	{ "CmpItemKindText", { ctermfg = 255, ctermbg = 58 } },

	{ "CmpItemKindMethod", { ctermfg = 255, ctermbg = 61 } },
	{ "CmpItemKindValue", { ctermfg = 255, ctermbg = 61 } },
	{ "CmpItemKindEnumMember", { ctermfg = 255, ctermbg = 61 } },

	{ "CmpItemKindInterface", { ctermfg = 255, ctermbg = 66 } },
	{ "CmpItemKindColor", { ctermfg = 255, ctermbg = 66 } },
	{ "CmpItemKindTypeParameter", { ctermfg = 255, ctermbg = 66 } },
}

M.setup = function(config)
	color_utils.setup_colorscheme(colorscheme, "mirec", "dark")
end

return M
