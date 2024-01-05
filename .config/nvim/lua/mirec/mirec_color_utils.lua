local M = {}

M.C_256 = {
	'#000000',
	'#800000',
	'#008000',
	'#808000',
	'#000080',
	'#800080',
	'#008080',
	'#c0c0c0',
	'#808080',
	'#ff0000',
	'#00ff00',
	'#ffff00',
	'#0000ff',
	'#ff00ff',
	'#00ffff',
	'#ffffff',
}

local r, g, b
local rv, gv, bv
for r = 0, 5 do
	for g = 0, 5 do
		for b = 0, 5 do
			rv = 55 + 40 * r
			gv = 55 + 40 * g
			bv = 55 + 40 * b
			if r == 0 then rv = 0; end
			if g == 0 then gv = 0; end
			if b == 0 then bv = 0; end
			table.insert(M.C_256, string.format("#%02x%02x%02x", rv, gv, bv))
		end
	end
end
for g = 0, 23 do
	gv = 0x08 + 10 * g
	table.insert(M.C_256, string.format("#%02x%02x%02x", gv, gv, gv))
end

M.setup_colorscheme = function(colorscheme, name, background)
	vim.cmd('hi clear')
	if vim.fn.exists('syntax_on') then
		vim.cmd('syntax reset')
	end
	vim.o.background = background
	vim.g.colors_name = name

	for _, highlight_definition in ipairs(colorscheme) do
		local name = highlight_definition[1];
		local colors = highlight_definition[2];
		if colors.ctermfg ~= nil then
			colors.fg = M.C_256[colors.ctermfg + 1]
		end
		if colors.ctermbg ~= nil then
			colors.bg = M.C_256[colors.ctermbg + 1]
		end
		if colors.cterm ~= nil then
			for key, val in pairs(colors.cterm) do
				if key == "bold" or key == "italic" or key == "reverse" or key == "underline" then
					colors[key] = val
				end
			end
		end
		vim.api.nvim_set_hl(0, name, colors)
	end
end

M.highlight_colorscheme = function()
	for color = 0, 255 do
		local colorValue = tonumber(string.sub(M.C_256[color + 1], 2, 7), 16)
		local b = colorValue % 256
		colorValue = colorValue - b
		colorValue = colorValue / 256
		local g = colorValue % 256
		colorValue = colorValue - g
		colorValue = colorValue / 256
		local r = colorValue % 256
		local luminance = 0.299*r + 0.587*g + 0.114*b
		local fg = 231 -- white
		if luminance > 127 then
			fg = 16
		end
		vim.api.nvim_set_hl(0, 'cterm_' .. color, {ctermbg=color, ctermfg=fg, nocombine=true, fg="#000000", cterm={bold=true, nocombine=true}})
		vim.cmd.syntax('match cterm_' .. color ..  ' "\\(cterm\\(f\\|b\\)g=\\)\\@<=' .. color .. '"')
	end
end

return M
