local present, zen_mode = pcall(require, "zen-mode")
if not present then
  return
end

zen_mode.setup({
  window = {
    backdrop = 1,
    width = (function()
      ---@diagnostic disable-next-line: undefined-field
      local colorcolumn = vim.opt.colorcolumn._value
      ---@diagnostic disable-next-line: undefined-field
      local signcolumn = string.match(vim.opt.signcolumn._value, "%d+$")

      local a = tonumber(colorcolumn)
      local b = tonumber(signcolumn) or 0
      local offset = 5 -- probably number

      return a + b + offset
    end)(),
    options = {
      number = true,
      relativenumber = true,
    },
  },

  plugins = {
  },
})

vim.keymap.set("n", "<leader>zz", function()
  require("zen-mode").toggle()
  vim.wo.wrap = false
  ConfigureLastStatus()
end)
