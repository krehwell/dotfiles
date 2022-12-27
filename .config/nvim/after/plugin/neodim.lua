local present, neodim = pcall(require, "neodim")
if not present then
  return
end

neodim.setup({
  alpha = 0.6,
  blend_color = "#000000",
  update_in_insert = {
    enable = false,
    delay = 100,
  },
  hide = {
    virtual_text = false,
    signs = false,
    underline = false,
  },
})
