return {
  "Exafunction/codeium.vim",
  event = "InsertEnter",
  config = function()
    vim.keymap.set("i", "<M-l>", function()
      return vim.fn["codeium#Accept"]()
    end, { expr = true })
    vim.keymap.set("i", "<M-]>", function()
      return vim.fn["codeium#CycleCompletions"](1)
    end, { expr = true })
    vim.keymap.set("i", "<M-[>", function()
      return vim.fn["codeium#CycleCompletions"](-1)
    end, { expr = true })
    vim.keymap.set("i", "<M-h>", function()
      return vim.fn["codeium#Clear"]()
    end, { expr = true })
  end,
}
