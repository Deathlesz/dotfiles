return {
    "rmagatti/auto-session",
    config = function()
        local auto_session = require("auto-session")

        auto_session.setup({
            auto_restore_enabled = false,
            auto_session_suppress_dirs = { "~/", "~/downloads" },
        })

        local keymap = vim.keymap

        keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "[R]estore [w]orkspace for working directory" })
        keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "[S]ave [w]orkspace for working directory" })
    end,
}
