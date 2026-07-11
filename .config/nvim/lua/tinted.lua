-- Shared palette loader for the base24 / no-distraction colorschemes.
-- Reads the active tinted-shell theme (the symlink tinted-shell keeps at
-- ~/.config/tinted-theming/base16_shell_theme) and maps its ANSI colorNN
-- slots to semantic base24 tokens. base16 and base24 scripts use the same
-- slot layout; base16 ones just define the brights (base12-17) as copies of
-- the normal accents, so both work. Falls back to default-dark hexes.
--
-- Slot layout (identical in every tinted-shell script):
--   color00..07 = base 00 08 0B 0A 0D 0E 0C 05 (ANSI normal)
--   color08..15 = base 03 12 14 13 16 17 15 07 (ANSI bright)
--   color16..21 = base 09 0F 01 02 04 06       (base16-shell extras)

local M = {}

-- token -> { ANSI slot, default-dark fallback }
local slots = {
    base00 = { 0, "#181818" }, -- background
    base01 = { 18, "#282828" }, -- lighter bg (cursorline)
    base02 = { 19, "#383838" }, -- selection bg
    base03 = { 8, "#585858" }, -- comments, invisibles (bright black)
    base04 = { 20, "#b8b8b8" }, -- dark foreground (status bars)
    base05 = { 7, "#d8d8d8" }, -- foreground
    base06 = { 21, "#e8e8e8" }, -- light foreground
    base07 = { 15, "#f8f8f8" }, -- light background (bright white)
    base08 = { 1, "#ab4642" }, -- red: variables, tags
    base09 = { 16, "#dc9656" }, -- orange: constants, numbers
    base0A = { 3, "#f7ca88" }, -- yellow: types, classes
    base0B = { 2, "#a1b56c" }, -- green: strings
    base0C = { 6, "#86c1b9" }, -- cyan: escapes, regex, special
    base0D = { 4, "#7cafc2" }, -- blue: functions
    base0E = { 5, "#ba8baf" }, -- magenta: keywords
    base0F = { 17, "#a16946" }, -- brown: deprecated, embedded
    base12 = { 9, "#ab4642" }, -- bright red
    base13 = { 11, "#f7ca88" }, -- bright yellow
    base14 = { 10, "#a1b56c" }, -- bright green
    base15 = { 14, "#86c1b9" }, -- bright cyan
    base16 = { 12, "#7cafc2" }, -- bright blue
    base17 = { 13, "#ba8baf" }, -- bright magenta
}

-- Parse fresh on every call (not module-cached) so `:colorscheme` after a
-- theme switch picks up the new palette without restarting nvim.
function M.load()
    local script = vim.fn.expand("~/.config/tinted-theming/base16_shell_theme")
    local c = {} -- ANSI slot -> "#rrggbb"
    if vim.fn.filereadable(script) == 1 then
        local refs = {} -- base16 scripts alias brights: color09="$color01"
        for line in io.lines(script) do
            local n, r, g, b = line:match('^color(%d+)="(%x%x)/(%x%x)/(%x%x)"')
            if n then
                c[tonumber(n)] = "#" .. r .. g .. b
            else
                local to, from = line:match('^color(%d+)="%$color(%d+)"')
                if to then refs[tonumber(to)] = tonumber(from) end
            end
        end
        for to, from in pairs(refs) do
            c[to] = c[from]
        end
    end
    local p = { ansi = c }
    for token, slot in pairs(slots) do
        p[token] = c[slot[1]] or slot[2]
    end
    return p
end

-- Scale a "#rrggbb" toward black. Used to derive a bar bg that's darker than
-- the theme background (works for dark and light schemes alike).
function M.darken(hex, f)
    local r = math.floor(tonumber(hex:sub(2, 3), 16) * f)
    local g = math.floor(tonumber(hex:sub(4, 5), 16) * f)
    local b = math.floor(tonumber(hex:sub(6, 7), 16) * f)
    return string.format("#%02x%02x%02x", r, g, b)
end

-- Keep Neovim's built-in `:terminal` and any terminal-color consumers on the
-- same 16-color palette the rest of the stack uses.
function M.terminal_colors(p)
    for i = 0, 15 do
        if p.ansi[i] then vim.g["terminal_color_" .. i] = p.ansi[i] end
    end
end

return M
