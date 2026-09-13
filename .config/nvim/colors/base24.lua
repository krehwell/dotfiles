-- base24 colorscheme: basic base16/base24 syntax highlighting, calm by design.
-- Variables/punctuation stay neutral; only meaningful tokens get color.
-- Palette follows the active tinted-shell theme (see lua/tinted.lua), so
-- switching with `base16-*` / `base24-*` repaints nvim too (on restart).
-- Tokens follow the base16 styling guide (strings=base0B, functions=base0D,
-- keywords=base0E, ...); diagnostics use the base24 brights (base12-17),
-- which on base16-only themes simply equal the normal accents.
-- Requires Neovim 0.12+

vim.cmd.highlight("clear")
if vim.fn.exists("syntax_on") then vim.cmd.syntax("reset") end
vim.o.termguicolors = true
vim.g.colors_name = "base24"

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
    DiagnosticUnderlineError = { undercurl = true, sp = p.base12 },
    DiagnosticUnderlineWarn = { undercurl = true, sp = p.base13 },
    DiagnosticUnderlineInfo = { undercurl = true, sp = p.base16 },
    DiagnosticUnderlineHint = { undercurl = true, sp = p.base15 },

    -- Tabs / splits.
    TabLineSel = { link = "DiffText" },
    TabLine = { link = "Conceal" },
    TabLineFill = { link = "Conceal" },
    WinSeparator = { link = "Conceal" },

    Directory = { fg = p.base0D },

    -- Snacks picker: mirror fzf-lua's files look. fzf resolves its colors
    -- from: DirPart->Comment, FzfMatch/FzfPrompt/FzfMarker->Special,
    -- FzfCursorLine->CursorLine, Border/Title->Normal (bright, not dim).
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

    IlluminatedWordText = { bg = illuminate },
    IlluminatedWordRead = { bg = illuminate },
    IlluminatedWordWrite = { bg = illuminate },
}

-- Syntax groups (vim builtin + treesitter), keyed by base24 token. Anything
-- not listed keeps its default; neutral tokens are mapped to fg explicitly.
local syntax = {
    [fg] = { -- variables, members, punctuation, modules: stay calm
        "Identifier",
        "Delimiter",
        "@variable",
        "@variable.parameter",
        "@variable.member",
        "@property",
        "@module",
        "@punctuation.bracket",
        "@punctuation.delimiter",
        "@constructor",
    },
    [p.base0B] = { -- strings
        "String",
        "Character",
        "@string",
        "@character",
        "@string.special.symbol",
        "@markup.raw",
    },
    [p.base09] = { -- constants, numbers
        "Constant",
        "Number",
        "Float",
        "Boolean",
        "@constant",
        "@constant.builtin",
        "@constant.macro",
        "@number",
        "@number.float",
        "@boolean",
    },
    [p.base0D] = { -- functions
        "Function",
        "@function",
        "@function.builtin",
        "@function.method",
        "@function.macro",
        "@markup.heading",
    },
    [p.base0E] = { -- keywords, operators
        "Keyword",
        "Statement",
        "Conditional",
        "Repeat",
        "Operator",
        "Exception",
        "@keyword",
        "@keyword.function",
        "@keyword.operator",
        "@operator",
        "@exception",
    },
    [p.base0A] = { -- types, classes, attributes
        "Type",
        "StorageClass",
        "Structure",
        "Typedef",
        "Label",
        "@type",
        "@type.builtin",
        "@label",
        "@attribute",
    },
    [p.base0C] = { -- escapes, regex, preproc special
        "Special",
        "PreProc",
        "Include",
        "Define",
        "Macro",
        "@annotation",
        "@punctuation.special",
        "@string.escape",
        "@tag.delimiter",
    },
    [p.base08] = { -- tags, builtin variables
        "@tag",
        "@variable.builtin",
    },
}

for color, names in pairs(syntax) do
    for _, g in ipairs(names) do
        groups[g] = { fg = color }
    end
end

for group, opts in pairs(groups) do
    vim.api.nvim_set_hl(0, group, opts)
end
