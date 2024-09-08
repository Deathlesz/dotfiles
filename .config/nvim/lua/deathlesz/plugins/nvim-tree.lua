return {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        local nvimtree = require("nvim-tree")

        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        nvimtree.setup({
            actions = {
                open_file = {
                    window_picker = {
                        enable = false,
                    },
                },
            },
            filters = {
                custom = { ".DS_Store" },
            },
            git = {
                ignore = false,
            },
        })

        local keymap = vim.keymap

        keymap.set("n", "<leader>et", "<cmd>NvimTreeToggle<CR>", { desc = "[T]oggle [e]xplorer" })
        keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "[T]oggle explorer on current [f]ile" })
        -- keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "[C]ollapse [e]xplorer" })
        keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "[R]efresh [e]xplorer" })
    end
}
