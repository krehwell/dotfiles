local present, lualine = pcall(require, "lualine")
if not present then
	return
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "seoul256",
		component_separators = {}, -- { left = '', right = '' },
		section_separators = {}, -- { left = '', right = '' },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			"branch", --[[ 'diff', 'diagnostics' ]]
		},
		lualine_c = { "filename" },
		lualine_x = { --[[ 'encoding', 'fileformat', 'filetype' ]]
		},
		lualine_y = { --[[ 'progress' ]]
		},
		lualine_z = { --[[ 'location' ]]
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})

----- TPIPELINE CONFIGURATION
vim.g.tpipeline_autoembed = 0
-- vim.g.tpipeline_statusline = '%!tpipeline#stl#airline()' -- tpipeline comes bundled with its own custom minimal statusline
-- vim.g.tpipeline_statusline = '%f'
-- You can also use standard statusline syntax, see :help stl
vim.g.tpipeline_cursormoved = 1

if vim.fn.exists("$TMUX") == 1 then
	vim.opt.laststatus = 0
end

function ConfigureLastStatus()
	if vim.env.TMUX ~= nil and vim.o.diff == false then
		vim.opt.laststatus = 0
	elseif vim.o.diff == true then
		vim.opt.laststatus = 2
	elseif vim.env.TMUX ~= nil then
		vim.opt.laststatus = 0
	end
end

vim.api.nvim_exec(
	[[
    " Last status checker on vim diff
    augroup DiffStatusLineAction
      autocmd!
      autocmd BufEnter * :lua ConfigureLastStatus()
    augroup END
  ]],
	false
)
