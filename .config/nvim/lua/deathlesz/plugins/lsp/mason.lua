return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")

        mason.setup({})
        mason_lspconfig.setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
            },
        })

        local mason_tool_installer = require("mason-tool-installer")

        mason_tool_installer.setup({
            ensure_installed = {
                "stylua",
                -- "rustfmt", -- deprecated: should be intalled via rustup
            }
        })
    end,
}
