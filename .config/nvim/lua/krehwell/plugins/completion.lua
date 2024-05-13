return {
	"echasnovski/mini.completion",
	version = false,
	-- event = "LspAttach",
	opts = {
		delay = { completion = 300, info = 100, signature = 50 },

		window = {
			info = { height = 25, width = 80, border = "none" },
			signature = { height = 25, width = 80, border = "none" },
		},

		lsp_completion = {
			-- `source_func` should be one of 'completefunc' or 'omnifunc'.
			source_func = "completefunc",
			auto_setup = true,
		},

		mappings = {
			force_twostep = "<C-Space>", -- Force two-step completion
			force_fallback = "<A-Space>", -- Force fallback completion
		},

		-- Whether to set Vim's settings for better experience (modifies
		-- `shortmess` and `completeopt`)
		set_vim_settings = true,
	},
}
