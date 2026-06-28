-- base16 colorscheme: basic base16 syntax highlighting, calm by design.
-- Variables/punctuation stay neutral; only meaningful tokens get color.
-- Requires Neovim 0.12+

vim.cmd.highlight("clear")
if vim.fn.exists("syntax_on") then vim.cmd.syntax("reset") end
vim.o.termguicolors = true
vim.g.colors_name = "base16"

-- Palette follows the active base16-shell theme, so switching with `base16-*`
-- repaints nvim too (on restart). Falls back to default-dark.
-- Parses color00..color21 ("rr/gg/bb") out of the theme's shell script.
-- $BASE16_THEME is unreliable (base16-shell's fish helper leaves it empty on
-- fresh shells), so read the ~/.base16_theme symlink directly — the real source.
local theme = vim.env.BASE16_THEME
if not theme or theme == "" then
    local target = vim.fn.resolve(vim.fn.expand("~/.base16_theme"))
    theme = vim.fs.basename(target):match("^base16%-(.+)%.sh$")
end
theme = theme or "default-dark"
local script = vim.fn.expand("~/.config/base16-shell/scripts/base16-" .. theme .. ".sh")
local c = {} -- index -> "#rrggbb"
if vim.fn.filereadable(script) == 1 then
    for line in io.lines(script) do
        local n, r, g, b = line:match('^color(%d+)="(%x%x)/(%x%x)/(%x%x)"')
        if n then c[tonumber(n)] = "#" .. r .. g .. b end
    end
end

local fg = c[7] or "#d8d8d8" -- base05 foreground (ANSI white)
local comment = c[20] or "#b8b8b8" -- base04, quiet but readable
local dim = c[8] or "#585858" -- base03 bright-black (borders)

-- Conventional base16 syntax colors.
local red = c[1] or "#ab4642"
local orange = c[16] or "#dc9656"
local yellow = c[3] or "#f7ca88"
local green = c[2] or "#a1b56c"
local cyan = c[6] or "#86c1b9"
local blue = c[4] or "#7cafc2"
local magenta = c[5] or "#ba8baf"

-- Scale a "#rrggbb" toward black. Used to derive a bar bg that's darker than
-- the theme background (works for dark and light schemes alike).
local function darken(hex, f)
    local r = math.floor(tonumber(hex:sub(2, 3), 16) * f)
    local g = math.floor(tonumber(hex:sub(4, 5), 16) * f)
    local b = math.floor(tonumber(hex:sub(6, 7), 16) * f)
    return string.format("#%02x%02x%02x", r, g, b)
end
local bg = c[0] or "#181818" -- base00 (editor background)
local bar = darken(bg, 0.6) -- base00 darkened, for the winbar

-- Keep Neovim's built-in `:terminal` and any terminal-color consumers on the
-- same 16-color palette the rest of the stack uses.
for i = 0, 15 do
    if c[i] then vim.g["terminal_color_" .. i] = c[i] end
end

---@type table<string, vim.api.keyset.highlight>
local groups = {
    Normal = { fg = fg, bg = bg },
    NormalNC = { link = "Normal" },
    NormalFloat = { bg = "none" },
    FloatBorder = { fg = dim },

    -- Cursorline: base01 (line-highlight slot) — subtle in both dark & light.
    CursorLine = { bg = c[18] or "#282828" },
    CursorColumn = { link = "CursorLine" },
    CursorLineNr = { fg = fg },

    -- Winbar / dropbar: bar bg darker than the editor background.
    WinBar = { fg = fg, bg = bar },
    WinBarNC = { fg = comment, bg = bar },

    -- Keep comments dimmed but distinguishable.
    Comment = { fg = comment, italic = true },
    DiagnosticUnnecessary = { link = "Comment" },
    DiagnosticUnderlineError = { undercurl = true, sp = red },
    DiagnosticUnderlineWarn = { undercurl = true, sp = yellow },
    DiagnosticUnderlineInfo = { undercurl = true, sp = blue },
    DiagnosticUnderlineHint = { undercurl = true, sp = cyan },

    -- Tabs / splits.
    TabLineSel = { link = "DiffText" },
    TabLine = { link = "Conceal" },
    TabLineFill = { link = "Conceal" },
    WinSeparator = { link = "Conceal" },

    Directory = { fg = blue },

    SnacksPickerDir = { link = "FzfLuaNormal" },
    SnacksPickerPathHidden = { link = "FzfLuaNormal" },

    IlluminatedWordText = { link = "Search" },
    IlluminatedWordRead = { link = "Search" },
    IlluminatedWordWrite = { link = "Search" },
}

-- Syntax groups (vim builtin + treesitter), keyed by color. Anything not
-- listed keeps its default; neutral tokens are mapped to fg explicitly.
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
    [green] = {
        "String",
        "Character",
        "@string",
        "@character",
        "@string.special.symbol",
        "@markup.raw",
    },
    [orange] = {
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
    [blue] = {
        "Function",
        "@function",
        "@function.builtin",
        "@function.method",
        "@function.macro",
        "@markup.heading",
    },
    [magenta] = {
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
    [yellow] = {
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
    [cyan] = {
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
    [red] = {
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
