-- convert code below using pcall
local present, colorizer = pcall(require, "nvim-highlight-colors")
if not present then
	return
end

colorizer.setup({
	render = "background", -- or 'foreground' or 'first_column'
	enable_named_colors = true,
	enable_tailwind = true,
})
