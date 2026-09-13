-- No-distraction colorscheme: strips syntax colors, keeps structure visible.
-- Uses the active tinted-shell palette (see lua/tinted.lua) for bg/cursorline/
-- winbar/comments, but every syntax token is flattened to `fg`. Comments stay
-- the one distinguishable token. For the colored variant, see `base24`.
-- Requires Neovim 0.12+

vim.cmd.highlight("clear")
if vim.fn.exists("syntax_on") then vim.cmd.syntax("reset") end
vim.o.termguicolors = true
vim.g.colors_name = "no-distraction"

local tinted = require("tinted")
local p = tinted.load()

local fg = p.base05
local comment = p.base04 -- guide says base03, but that's too dim to read
local dim = p.base03 -- borders, invisibles
local bg = p.base00
local bar = tinted.darken(bg, 0.6) -- winbar bg, darker than the editor bg
local illuminate = tinted.mix(p.base01, p.base02, 0.5) -- above cursorline, below Visual

tinted.terminal_colors(p)

---@type table<string, vim.api.keyset.highlight>
local groups = {
    Normal = { fg = fg, bg = bg },
    NormalNC = { link = "Normal" },
    NormalFloat = { bg = "none" },
    FloatBorder = { fg = dim },

    -- Cursorline: base01 (line-highlight slot) — subtle in both dark & light.
    CursorLine = { bg = p.base01 },
    CursorColumn = { link = "CursorLine" },
    CursorLineNr = { fg = fg },
    Visual = { bg = p.base02 },

    -- Winbar / dropbar: bar bg darker than the editor background.
    WinBar = { fg = fg, bg = bar },
    WinBarNC = { fg = comment, bg = bar },

    -- Keep comments dimmed but distinguishable.
    Comment = { fg = comment, italic = true },
    DiagnosticUnnecessary = { link = "Comment" },

    -- Tabs / splits.
    TabLineSel = { link = "DiffText" },
    TabLine = { link = "Conceal" },
    TabLineFill = { link = "Conceal" },
    WinSeparator = { link = "Conceal" },

    -- Snacks picker: mirror fzf-lua's files look (see base24.lua). Special
    -- is flattened to fg in this scheme, so match/prompt flatten too —
    -- consistent with how fzf_colors resolves them here.
    SnacksPickerDir = { fg = comment },
    SnacksPickerPathHidden = { fg = fg },
    SnacksPickerFile = { fg = fg },
    SnacksPickerMatch = { link = "Special" },
    SnacksPickerListCursorLine = { link = "CursorLine" },
    SnacksPickerBorder = { fg = fg },
    SnacksPickerTitle = { fg = fg },
    SnacksPickerPrompt = { link = "Special" },
    SnacksPickerSelected = { link = "Special" },
    SnacksPickerInputSearch = { fg = fg },

    -- Illuminate.
    IlluminatedWordText = { bg = illuminate },
    IlluminatedWordRead = { bg = illuminate },
    IlluminatedWordWrite = { bg = illuminate },
}

-- Every syntax token (vim builtin + treesitter) flattened to fg — no color.
local flat = {
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
    "Delimiter",
    "Statement",
    "Conditional",
    "Repeat",
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
    "@string.escape",
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

for _, g in ipairs(flat) do
    groups[g] = { fg = fg }
end

for group, opts in pairs(groups) do
    vim.api.nvim_set_hl(0, group, opts)
end
