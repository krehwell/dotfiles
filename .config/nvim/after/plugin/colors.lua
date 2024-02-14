-- vim.cmd("syntax off")
-- vim.opt.termguicolors = true
-- vim.opt.background = "dark"
vim.opt.fillchars = {
	vert = "╏", -- alternatives │
	fold = " ",
	eob = "~", -- suppress ~ at EndOfBuffer
	diff = "╱", -- alternatives = ⣿ ░ ─
	msgsep = "‾",
	foldopen = "▾",
	foldsep = "│",
	foldclose = "▸",
	stlnc = "‐",
	stl = "_",
}
vim.opt.laststatus = 0
vim.cmd([[ let &statusline='%#VertSplit#' ]]) -- color the split window dashes

local colorscheme = vim.g.colors_name

-- save local wezterm color
vim.cmd([[
  if exists('g:wezterm')
    let g:term_foreground = get(g:wezterm, 'colors', {}).foreground
    let g:term_background = get(g:wezterm, 'colors', {}).background
  endif
]])

-- COLORS MOD
vim.cmd([[
  augroup custom_highlight
    " au!
    " hi! Normal guibg=g:term_background " guifg=g:term_foreground ctermbg=NONE
    " hi! VertSplit guibg=NONE guifg=NONE ctermbg=NONE ctermfg=NONE
    " hi! SignColumn guibg=NONE
    " hi! Pmenu guibg=NONE guifg=Normal
      hi! link TabLine LineNr
      hi! link TabLineFill LineNr
      hi! link FloatBorder Normal
      hi! link LspInfoBorder Normal
      hi! link NormalFloat Normal

      set guicursor=n-c-v:block-Cursor
      set guicursor+=v:block-vCursor
      set guicursor+=a:blinkon0
      set guicursor+=n:blinkon80
  augroup END
]])

-- COLORS MOD on `colorscheme === mirec`
if colorscheme == "mirec" then
	vim.cmd([[
    augroup custom_mirec
      au!
      hi! diffFile       guifg=#2f81f7
      hi! diffIndexLine  guifg=#ff7b72
      hi! diffLine       guifg=#79c0ff
      hi! diffNewFile    guifg=#7d8590
      hi! diffOldFile    guifg=#d29922
      hi! diffRemoved    guifg=#f85149 guibg=#2c171b
      hi! diffChanged    guifg=#d29922 guibg=#231e14
      hi! diffAdded      guifg=#3fb950 guibg=#10231c
      hi! link DiffAdd    diffAdded
      hi! link DiffChange diffChanged
      hi! link DiffDelete diffRemoved
      hi! DiffText   guifg=#e6edf3 guibg=#171b22
      hi! link @text.diff.add  diffAdded
      hi! link @text.diff.delete diffRemoved
      hi! GitSignsChange guifg=#d29922
      hi! GitSignsAdd guifg=#3fb950
      hi! GitSignsDelete guifg=#f85149
      hi! link GitSignsChangedelete  GitSignsChange
      hi! link GitSignsTopdelete  GitSignsDelete
      hi! link GitSignsUntracked  GitSignsAdd
      hi! link GitSignsAddNr   GitSignsAdd
      hi! link GitSignsChangeNr  GitSignsChange
      hi! link GitSignsDeleteNr  GitSignsDelete
      hi! link GitSignsChangedeleteNr  GitSignsChangeNr
      hi! link GitSignsTopdeleteNr  GitSignsDeleteNr
      hi! link GitSignsUntrackedNr  GitSignsAddNr
      hi! link GitSignsAddLn   DiffAdd
      hi! link GitSignsChangeLn  DiffChange
      hi! link GitSignsChangedeleteLn  GitSignsChangeLn
      hi! link GitSignsUntrackedLn  GitSignsAddLn
      hi! GitSignsStagedAdd guifg=#1f5c28
      hi! GitSignsStagedChange guifg=#694c11
      hi! GitSignsStagedDelete guifg=#7c2824
      hi! GitSignsStagedChangedelete guifg=#694c11
      hi! GitSignsStagedTopdelete guifg=#7c2824
      hi! GitSignsStagedAddNr guifg=#1f5c28
      hi! GitSignsStagedChangeNr guifg=#694c11
      hi! GitSignsStagedDeleteNr guifg=#7c2824
      hi! GitSignsStagedChangedeleteNr guifg=#694c11
      hi! GitSignsStagedTopdeleteNr guifg=#7c2824
      hi! GitSignsStagedAddLn guifg=#1f5c28 guibg=#10231c
      hi! GitSignsStagedChangeLn guifg=#694c11 guibg=#231e14
      hi! GitSignsStagedChangedeleteLn guifg=#694c11 guibg=#231e14
      hi! link GitSignsAddPreview  DiffAdd
      hi! link GitSignsDeletePreview  DiffDelete
      hi! link GitSignsCurrentLineBlame  NonText
      hi! link GitSignsAddInline  TermCursor
      hi! link GitSignsDeleteInline  TermCursor
      hi! link GitSignsChangeInline  TermCursor
      hi! link GitSignsAddLnInline  GitSignsAddInline
      hi! link GitSignsChangeLnInline  GitSignsChangeInline
      hi! link GitSignsDeleteLnInline  GitSignsDeleteInline
      hi! link GitSignsDeleteVirtLn  DiffDelete
      hi! link GitSignsDeleteVirtLnInLine  GitSignsDeleteLnInline
      hi! link GitSignsVirtLnum  GitSignsDeleteVirtLn
    augroup END
  ]])
end
