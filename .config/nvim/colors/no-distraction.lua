-- No-distraction colorscheme: strips syntax colors, keeps structure visible.
-- Requires Neovim 0.12+

vim.cmd.highlight("clear")
if vim.fn.exists("syntax_on") then
	vim.cmd.syntax("reset")
end
vim.o.termguicolors = true
vim.g.colors_name = "no-distraction"

local fg = "NvimLightGrey2"

---@type table<string, vim.api.keyset.highlight>
local groups = {
	Normal = { bg = "none" },
	NormalNC = { link = "Normal" },
	NormalFloat = { bg = "none" },
	FloatBorder = { fg = "NvimLightGrey4", update = true },

	-- Keep comments dimmed but distinguishable.
	Comment = { fg = "NvimLightGrey4", italic = true, update = true },
	DiagnosticUnnecessary = { link = "Comment" },

	-- Tabs / splits.
	TabLineSel = { link = "DiffText" },
	TabLine = { link = "Conceal" },
	TabLineFill = { link = "Conceal" },
	WinSeparator = { link = "Conceal" },

	-- Illuminate.
	IlluminatedWordText = { link = "MatchParen" },
	IlluminatedWordRead = { link = "MatchParen" },
	IlluminatedWordWrite = { link = "MatchParen" },
}

-- Vim builtin syntax groups to flatten.
local vim_syntax = {
    "Normal",
	"Module",
	"Constant",
	"String",
	"Character",
	"Number",
	"Boolean",
	"Float",
	"Operator",
	"Identifier",
	"Function",
	"Label",
	"Keyword",
	"Exception",
	"PreProc",
	"Include",
	"Define",
	"Macro",
	"Type",
	"StorageClass",
	"Structure",
	"Typedef",
	"Special",
}

for _, g in ipairs(vim_syntax) do
	groups[g] = { fg = fg }
end

-- Treesitter capture groups to flatten (new @-style).
local ts_captures = {
	"@annotation",
	"@attribute",
	"@boolean",
	"@character",
	"@constructor",
	"@constant",
	"@constant.builtin",
	"@constant.macro",
	"@exception",
	"@variable.member",
	"@number.float",
	"@function",
	"@function.macro",
	"@function.builtin",
	"@function.method",
	"@keyword",
	"@keyword.function",
	"@keyword.operator",
	"@label",
	"@module",
	"@number",
	"@operator",
	"@variable.parameter",
	"@property",
	"@punctuation.bracket",
	"@punctuation.special",
	"@punctuation.delimiter",
	"@string",
	"@string.special.symbol",
	"@tag",
	"@tag.delimiter",
	"@markup",
	"@markup.heading",
	"@markup.raw",
	"@type",
	"@type.builtin",
	"@variable",
	"@variable.builtin",
}

for _, g in ipairs(ts_captures) do
	groups[g] = { fg = fg }
end

for group, opts in pairs(groups) do
	vim.api.nvim_set_hl(0, group, opts)
end
