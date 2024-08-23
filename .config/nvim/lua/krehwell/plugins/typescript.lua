return {
	"pmizio/typescript-tools.nvim",
	ft = { "typescript", "typescriptreact", "javascript" },
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    keys = {
        { "<leader>ts", ":TSTools", desc = "TSTools options" },
    },
	opts = {},
}
