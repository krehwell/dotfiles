-- mark an important file using `ma` and manage it using `mo`
return {
    "alucherdi/hand-of-god",
    keys = {
        { "mo", ":norm mme<CR>", desc = "hand-of-god open edit mode" },
        { "ma", desc = "hand-of-god add file" },
    },
    config = function(_, opts)
        local jumper = require("handofgod.jumper")
        jumper.setup()

        -- add file to jumper list
        vim.keymap.set("n", "ma", function()
            jumper.add()
            print("(hand-of-god) mark added")
        end)

        -- explore jumper list as buffer
        vim.keymap.set("n", "mo", function()
            jumper:explore()
            vim.cmd("setlocal cursorline")
            print("(hand-of-god) explore marks")
        end)
    end,
}
