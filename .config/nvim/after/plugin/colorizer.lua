-- convert code below using pcall
local present, colorizer = pcall(require, "colorizer")
if not present then
	return
end

colorizer.setup({
	"*",
	css = { css = true, css_fn = true },
	html = { css = true, css_fn = true },
})
