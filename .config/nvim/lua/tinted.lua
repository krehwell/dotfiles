-- Static palette for the no-distraction colorscheme (base16 default-dark).
local M = {}

local palette = {
    base00 = "#181818", -- background
    base01 = "#282828", -- lighter bg (cursorline)
    base02 = "#383838", -- selection bg
    base03 = "#585858", -- comments, invisibles
    base04 = "#b8b8b8", -- dark foreground (status bars)
    base05 = "#d8d8d8", -- foreground
    base06 = "#e8e8e8", -- light foreground
    base07 = "#f8f8f8", -- light background
    base08 = "#ab4642", -- red: variables, tags
    base09 = "#dc9656", -- orange: constants, numbers
    base0A = "#f7ca88", -- yellow: types, classes
    base0B = "#a1b56c", -- green: strings
    base0C = "#86c1b9", -- cyan: escapes, regex, special
    base0D = "#7cafc2", -- blue: functions
    base0E = "#ba8baf", -- magenta: keywords
    base0F = "#a16946", -- brown: deprecated, embedded
    base12 = "#ab4642",
    base13 = "#f7ca88",
    base14 = "#a1b56c",
    base15 = "#86c1b9",
    base16 = "#7cafc2",
    base17 = "#ba8baf",
}

function M.load() return palette end

-- Mix two "#rrggbb" colors: f=0 gives a, f=1 gives b.
function M.mix(a, b, f)
    local out = "#"
    for i = 2, 6, 2 do
        local ca = tonumber(a:sub(i, i + 1), 16)
        local cb = tonumber(b:sub(i, i + 1), 16)
        out = out .. string.format("%02x", math.floor(ca + (cb - ca) * f + 0.5))
    end
    return out
end

-- Scale a "#rrggbb" toward black.
function M.darken(hex, f)
    local r = math.floor(tonumber(hex:sub(2, 3), 16) * f)
    local g = math.floor(tonumber(hex:sub(4, 5), 16) * f)
    local b = math.floor(tonumber(hex:sub(6, 7), 16) * f)
    return string.format("#%02x%02x%02x", r, g, b)
end

function M.terminal_colors() end

return M
