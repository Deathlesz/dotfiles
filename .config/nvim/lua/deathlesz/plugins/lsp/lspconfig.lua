return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
			callback = function(ev)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = ev.buf, desc = desc })
				end

				map("gR", "<cmd>Telescope lsp_references<CR>", "[G]o to LSP [r]eferences")
				map("gD", vim.lsp.buf.declaration, "[G]o to [d]eclaration")
				map("gd", "<cmd>Telescope lsp_definitions<CR>", "[G]o to LSP [d]efinitions")
				map("gi", "<cmd>Telescope lsp_implementations<CR>", "[G]o to LSP [i]mplementations")
				map("gt", "<cmd>Telescope lsp_type_definitions<CR>", "[G]o to LSP [t]ype definitions")
				vim.keymap.set(
					{ "n", "v" },
					"<leader>ca",
					vim.lsp.buf.code_action,
					{ desc = "See available [c]ode [a]ctions" }
				)
				map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
				map("<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", "Show buffer [d]iagnostics")
				map("<leader>d", vim.diagnostic.open_float, "Show line [d]iagnostics")
				map("[d", vim.diagnostic.goto_prev, "Go to previous [d]iagnostic")
				map("]d", vim.diagnostic.goto_next, "Go to next [d]iagnostic")
				map("K", vim.lsp.buf.hover, "Show documentation for what is under cursor")
			end,
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, cmp_nvim_lsp.default_capabilities())

		local servers = {
			lua_ls = {
				settings = {
					Lua = {
						diagnostics = {
							-- globals = { "vim" },
							disable = { "missing-fields" },
						},
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			},
			rust_analyzer = {
				settings = {
					["rust-analyzer"] = {
						check = {
							command = "clippy",
						},
					},
				},
			},
		}

		mason_lspconfig.setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}

					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					lspconfig[server_name].setup(server)
				end,
			},
		})
	end,
}
