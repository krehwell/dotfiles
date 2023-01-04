-- Modes:
--   Normal       = "n"
--   Insert       = "i"
--   Visual       = "v"
--   Visual_Block = "x"
--   Terminal     = "t"
--   Command      = "c"
--
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

--- BASIC MAPPING
vim.keymap.set("n", "<Leader>-", ":vertical resize -23<CR>")
vim.keymap.set("n", "<Leader>=", ":vertical resize +23<CR>")
vim.keymap.set("n", "<esc>", "<esc>:noh<CR><esc>", { silent = true })
vim.keymap.set("i", "jj", "<c-o>:call search('}\\|)\\|]\\|>\\|\"', 'cW')<cr><Right>")

----- useful `[[`
vim.keymap.set("n", "[[", ":?{<CR>w99[{<CR>:noh<CR>", { silent = true })
vim.keymap.set("n", "][", ":/}<CR>b99]}<CR>:noh<CR>", { silent = true })
vim.keymap.set("n", "]]", ":j0[[%/{<CR><CR>:noh<CR>", { silent = true })
vim.keymap.set("n", "[]", ":k$][%?}<CR><CR>:noh<CR>", { silent = true })

----- EDITING
vim.keymap.set("n", "<M-j>", "ddp")
vim.keymap.set("n", "<M-k>", "ddkP")
vim.keymap.set("n", "<localleader>a", "ggVG")
vim.keymap.set("v", "b", "B")
vim.keymap.set("v", "$", "$<left>")
vim.keymap.set("v", "w", "e")

----- SESSION BUFFER CONTROLLER
vim.keymap.set("n", "<localleader>b", ":bprevious<CR>")
vim.keymap.set("n", "<localleader>n", ":bnext<CR>")
vim.keymap.set("n", "<localleader>o", ":source ~\\.vim\\vim_session<cr>") -- TODO: per file name instead maybe?
vim.keymap.set("n", "<localleader>s", ":mksession! ~\\.vim\\vim_session<cr>") -- So, instead of <cr>, should just defined the name instead

----- CD TO CURRENT BUFFER's DIR | lcd -> for cding the current buffer only to the current dir
vim.keymap.set("n", "<localleader>cd", ":cd %:p:h<CR>")
vim.keymap.set("n", "<localleader>lcd", ":lcd %:p:h<CR>")
