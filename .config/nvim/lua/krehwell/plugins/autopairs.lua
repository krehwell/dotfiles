return {
    "echasnovski/mini.pairs",
    version = false,
    event = "InsertEnter",
    config = function()
        require("mini.pairs").setup({})
    end,
}

-- return {
-- 	"altermo/ultimate-autopair.nvim",
-- 	event = { "InsertEnter" },
-- 	branch = "v0.6",
-- 	opts = {
-- 		cmap = false,
-- 		pair_cmap = false,
-- 	},
-- }
