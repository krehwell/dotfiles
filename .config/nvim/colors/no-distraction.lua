-- No-distraction colorscheme: strips syntax colors, keeps structure visible.
-- Requires Neovim 0.12+

vim.cmd.highlight("clear")
if vim.fn.exists("syntax_on") then
	vim.cmd.syntax("reset")
end
vim.o.termguicolors = true
vim.g.colors_name = "no-distraction"

-- Basic palette: Base16 Default Dark, matching Alacritty + Claude Code (dark-ansi).
-- Everything else gets mapped through to `fg` so syntax stays flat.
local fg = "#d8d8d8" -- base16 foreground (ANSI white)
local comment = "#8e8e8e" -- Claude Code's dim text color (readable, quiet)
local dim = "#585858" -- base16 bright-black (borders)

-- Keep Neovim's built-in `:terminal` and any terminal-color consumers on the
-- same 16-color palette the rest of the stack uses.
local palette = {
	"#181818", "#ab4642", "#a1b56c", "#f7ca88", -- black red green yellow
	"#7cafc2", "#ba8baf", "#86c1b9", "#d8d8d8", -- blue magenta cyan white
	"#585858", "#ab4642", "#a1b56c", "#f7ca88", -- bright variants
	"#7cafc2", "#ba8baf", "#86c1b9", "#f8f8f8",
}
for i, color in ipairs(palette) do
	vim.g["terminal_color_" .. (i - 1)] = color
end

---@type table<string, vim.api.keyset.highlight>
local groups = {
	Normal = { bg = "none" },
	NormalNC = { link = "Normal" },
	NormalFloat = { bg = "none" },
	FloatBorder = { fg = dim },

	-- Keep comments dimmed but distinguishable.
	Comment = { fg = comment, italic = true },
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
