local present, fidget = pcall(require, "fidget")
if not present then
	return
end

fidget.setup({
	window = {
		relative = "win", -- where to anchor, either "win" or "editor"
		blend = 0, -- &winblend for the window
		zindex = nil, -- the zindex value for the window
		border = "none", -- style of border for the fidget window
	},
})
