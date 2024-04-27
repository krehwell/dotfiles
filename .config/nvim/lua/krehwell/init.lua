require("krehwell.set")
require("krehwell.remap")
require("krehwell.lazy")

vim.opt.cmdheight = 1

-- vim.api.nvim_create_autocmd("CmdlineEnter", {
-- 	group = vim.api.nvim_create_augroup("cmdheight_1_on_cmdlineenter", { clear = true }),
-- 	desc = "Don't hide the status line when typing a command",
-- 	command = ":set cmdheight=1",
-- })
--
-- vim.api.nvim_create_autocmd("CmdlineLeave", {
-- 	group = vim.api.nvim_create_augroup("cmdheight_0_on_cmdlineleave", { clear = true }),
-- 	desc = "Hide cmdline when not typing a command",
-- 	command = ":set cmdheight=0",
-- })
--
-- vim.api.nvim_create_autocmd("BufWritePost", {
-- 	group = vim.api.nvim_create_augroup("hide_message_after_write", { clear = true }),
-- 	desc = "Get rid of message after writing a file",
-- 	pattern = { "*" },
-- 	command = "redrawstatus",
-- })
