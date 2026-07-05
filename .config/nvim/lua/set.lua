vim.loader.enable()

-- Use an indentation of 4 spaces.
vim.opt.backspace = "2"
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.textwidth = 120
vim.opt.cursorline = true

-- HIDDEN FILE RELATED CONFIG
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.autoread = true
vim.cmd("packadd nvim.difftool")
vim.cmd("packadd nvim.undotree")
-- vim.cmd("packadd nvim.tohtml")

-- WINDOW BEHAVIOR
-- vim.opt.colorcolumn = "120"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.eadirection = "both"
vim.opt.equalalways = true
vim.opt.title = true
vim.opt.winborder = "rounded"
vim.opt.wildmenu = true
require("vim._core.ui2").enable()

-- Completion.
vim.opt.wildignore:append({ ".DS_Store" })
vim.o.completeopt = "menuone,noselect,noinsert"
-- vim.o.pumheight = 15
-- vim.o.autocomplete = true
-- vim.o.pumborder = "rounded"

-- SHOW WHITESPACE
-- vim.opt.list = true
vim.opt.listchars = { space = "⋅", trail = "⋅", tab = "  ↦" }

-- NAVIGATION BEHAVIOR
vim.opt.wrap = false
-- vim.opt.number = true
-- vim.opt.relativenumber = true
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
vim.opt.incsearch = true
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
-- vim.opt.hidden = true
vim.o.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,t:block-TermCursor"
vim.opt.termguicolors = true
vim.opt.buflisted = false
vim.opt.compatible = false
vim.opt.showmode = true
-- vim.opt.ttimeoutlen = 0
vim.opt.updatetime = 400
vim.opt.exrc = true
vim.opt.secure = true
