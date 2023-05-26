return {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  version = "*",
  lazy = true,
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },
  event = "CursorMoved",
  keys = {
    { "[[", ":lua require('barbecue.ui').navigate(-1)<CR>", desc = "Jump to parent function", silent = true },
  },
  opts = {
    -- create_autocmd = false,
    show_dirname = true,
    show_modified = true,
    modifiers = {
      dirname = ":h:t",
      basename = "",
    },
    theme = {
      normal = { bg = "#303030", fg = "#c6c6c6" },
    },
    symbols = {
      modified = "+",
      ellipsis = "…",
      separator = ">",
    },
    kinds = {
      File = "📄",
      Module = "📦",
      Namespace = "🗂️",
      Package = "📦",
      Class = "🏛️",
      Method = "🛠️",
      Property = "🏷️",
      Field = "🌾",
      Constructor = "🏗️",
      Enum = "#️⃣",
      Interface = "🖥️",
      Function = "🛠️",
      Variable = "🧺",
      Constant = "💪",
      String = "📜",
      Number = "🔢",
      Boolean = "✅",
      Array = "[]",
      Object = "{}",
      Key = "🔑",
      Null = "🅾️",
      EnumMember = "💡",
      Struct = "📓{}",
      Event = "🎉",
      Operator = "🧮",
      TypeParameter = "⚙️",
    },
  },
  config = function(_, opts)
    vim.opt.laststatus = 0
    vim.api.nvim_create_autocmd({
      "WinScrolled",
      "BufWinEnter",
      "CursorHold",
      "InsertLeave",

      "BufWritePost",
      "TextChanged",
      "TextChangedI",
    }, {
      group = vim.api.nvim_create_augroup("barbecue.updater", {}),
      callback = function()
        require("barbecue.ui").update()
      end,
    })

    local barbecue = require("barbecue")
    barbecue.setup(opts)
  end,
}
