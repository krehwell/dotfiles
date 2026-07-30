-- Use an indentation of 4 spaces.
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.textwidth = 120
vim.opt.cursorline = true

-- HIDDEN FILE RELATED CONFIG
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.cmd("packadd nvim.difftool")
vim.cmd("packadd nvim.undotree")

-- WINDOW BEHAVIOR
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.eadirection = "both"
vim.opt.equalalways = true
vim.opt.title = true
vim.opt.winborder = "rounded"
require("vim._core.ui2").enable()

-- Completion.
vim.opt.wildignore:append({ ".DS_Store" })
vim.o.completeopt = "menuone,noselect,noinsert"

-- SHOW WHITESPACE (only visible via :set list)
vim.opt.listchars = { space = "⋅", trail = "⋅", tab = "  ↦" }

-- NAVIGATION BEHAVIOR
vim.opt.wrap = false
vim.opt.signcolumn = "yes:1"
vim.opt.scrolloff = 22
vim.opt.sidescrolloff = 18
vim.opt.virtualedit = "block"
vim.opt.laststatus = 0
vim.opt.fillchars = {
    vert = "│", -- alternatives │
    fold = " ",
    eob = "~", -- suppress ~ at EndOfBuffer
    diff = "╱", -- alternatives = ⣿ ░ ─
    msgsep = "‾",
    foldopen = "▾",
    foldsep = "│",
    foldclose = "▸",
    stlnc = "—",
    stl = "—",
}

-- SEARCH/FIND BEHAVIOR
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.shortmess:append({ w = true, s = true })

-- DISABLE HEALTH CHECKS FOR THESE PROVIDERS.
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

-- CLIPBOARD OVER SSH (OSC 52)
if os.getenv("SSH_TTY") or os.getenv("SSH_CONNECTION") then
    local osc52 = require("vim.ui.clipboard.osc52")
    vim.g.clipboard = {
        name = "OSC 52",
        copy = { ["+"] = osc52.copy("+"), ["*"] = osc52.copy("*") },
        paste = { ["+"] = osc52.paste("+"), ["*"] = osc52.paste("*") },
    }
end

-- ETC
vim.o.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,t:block-TermCursor"
vim.opt.updatetime = 400
vim.opt.exrc = true
vim.opt.secure = true
