return {
    "gbprod/substitute.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local substitute = require("substitute")
        
        substitute.setup()

        local keymap = vim.keymap

        keymap.set("n", "s", substitute.operator, { desc = "[S]ubstitute with motion" })
        keymap.set("n", "ss", substitute.line, { desc = "[S]ubstitute line" })
        keymap.set("n", "S", substitute.eol, { desc = "[S]ubstitute to EOL" })
        keymap.set("x", "s", substitute.visual, { desc = "[S]ubstitute in visual mode" })
    end,
}
