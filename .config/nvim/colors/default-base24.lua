-- default-base24 colorscheme: Neovim's stock default token assignments,
-- recolored from the active tinted-shell palette (see lua/tinted.lua).
-- Same minimal philosophy as stock: most tokens stay neutral fg; only
-- comments (grey), strings (green), identifiers (blue), functions/specials
-- (cyan) and diagnostics get color. UI chrome matches the base24 scheme.
-- Stock hex -> token: #e0e2ea->base05, #9b9ea4->base04, green->base0B,
-- blue->base0D, cyan->base0C, red->base08, yellow->base0A.
-- Requires Neovim 0.12+

vim.cmd.highlight("clear")
if vim.fn.exists("syntax_on") then vim.cmd.syntax("reset") end
vim.o.termguicolors = true
vim.g.colors_name = "default-base24"

local tinted = require("tinted")
local p = tinted.load()

local fg = p.base05
local comment = p.base04 -- stock uses its grey4; base04 is our equivalent
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

    -- Tabs / splits.
    TabLineSel = { link = "DiffText" },
    TabLine = { link = "Conceal" },
    TabLineFill = { link = "Conceal" },
    WinSeparator = { link = "Conceal" },

    -- Snacks picker: mirror fzf-lua's files look (see base24.lua).
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

    -- Stock default syntax, tinted. Groups not listed keep their built-in
    -- defaults, which already link to these (Number -> Constant, @string ->
    -- String, ...). Stock colors these with hardcoded Nvim greys, so every
    -- explicitly-colored stock group needs re-stating here.
    Comment = { fg = comment }, -- stock is not italic
    DiagnosticUnnecessary = { link = "Comment" },
    String = { fg = p.base0B },
    Identifier = { fg = p.base0D },
    Function = { fg = p.base0C },
    Special = { fg = p.base0C },
    Directory = { fg = p.base0C },
    Constant = { fg = fg },
    Statement = { fg = fg, bold = true },
    Operator = { fg = fg },
    PreProc = { fg = fg },
    Type = { fg = fg },
    Delimiter = { fg = fg },
    ["@variable"] = { fg = fg },
    Title = { fg = fg, bold = true },

    Added = { fg = p.base0B },
    Removed = { fg = p.base08 },
    Changed = { fg = p.base0D },

    DiagnosticError = { fg = p.base08 },
    DiagnosticWarn = { fg = p.base0A },
    DiagnosticInfo = { fg = p.base0C },
    DiagnosticHint = { fg = p.base0D },
    DiagnosticUnderlineError = { undercurl = true, sp = p.base12 },
    DiagnosticUnderlineWarn = { undercurl = true, sp = p.base13 },
    DiagnosticUnderlineInfo = { undercurl = true, sp = p.base15 },
    DiagnosticUnderlineHint = { undercurl = true, sp = p.base16 },
}

for group, opts in pairs(groups) do
    vim.api.nvim_set_hl(0, group, opts)
end
