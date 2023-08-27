require("krehwell")

local augroup = vim.api.nvim_create_augroup
local KrehwellGroup = augroup("Krehwell", {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

autocmd("TextYankPost", {
  group = yank_group,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 60,
    })
  end,
})

autocmd({ "BufWritePre" }, {
  group = KrehwellGroup,
  pattern = "*",
  command = [[%s/\s\+$//e]],
})
