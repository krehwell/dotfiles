vim.opt.background = "dark"
vim.opt.termguicolors = true
vim.api.nvim_exec(
  [[
      " set t_Co=256
  ]],
  false
)
vim.opt.fillchars = {
  vert = "┆", -- alternatives │
  fold = " ",
  eob = "~", -- suppress ~ at EndOfBuffer
  diff = "╱", -- alternatives = ⣿ ░ ─
  msgsep = "‾",
  foldopen = "▾",
  foldsep = "│",
  foldclose = "▸",
}

-- OFF COLORSCHEME PRECONFIGURATION
vim.g.colors_off_a_little = 1
vim.g.monochrome_italic_comments = 1

local colorscheme = "off"
local present, _ = pcall(vim.api.nvim_command, "colorscheme " .. colorscheme)
if not present then
  return print("colorscheme " .. colorscheme .. " not found!")
end

if colorscheme == "off" then
  vim.api.nvim_exec(
    [[
        augroup transparent_signs
          au!
          hi! Normal guibg=NONE guifg=#F1F1F1 ctermbg=NONE
          hi! VertSplit guibg=NONE guifg=NONE ctermbg=NONE ctermfg=NONE
          hi! LineNR ctermfg=242 ctermbg=235 guifg=#6b6b6b
          hi! SignColumn guibg=NONE
          " hi! Pmenu guibg=#NONE
          hi! PmenuSel guifg=#ffffff
          hi clear Todo
        augroup END
      ]],
    false
  )
end

if colorscheme == "fogbell" then
  vim.api.nvim_exec(
    [[
        augroup transparent_signs
          au!
          hi! Normal guibg=NONE ctermbg=NONE
          hi! VertSplit guibg=NONE guifg=NONE ctermbg=NONE ctermfg=NONE
          hi! SignColumn guibg=NONE
          hi! LineNr guibg=NONE
        augroup END

        augroup index_color
          au!
          hi! link TelescopeMatching DiffAdd
          hi! link TelescopeSelection PMenuSel
        augroup END
      ]],
    false
  )
end
