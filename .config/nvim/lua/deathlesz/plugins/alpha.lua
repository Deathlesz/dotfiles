return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.buttons.val = {
			dashboard.button("e", " > New file", "<cmd>ene<CR>"),
			dashboard.button("SPC et", " > Open file explorer", "<cmd>NvimTreeToggle<CR>"),
			dashboard.button("SPC fs", " > Find string", "<cmd>Telescope live_grep<CR>"),
			dashboard.button("SPC wr", "󰁯 > Restore workspace for current directory", "<cmd>SessionRestore<CR>"),
			dashboard.button("q", " > Quit", "<cmd>qa<CR>"),
		}

		alpha.setup(dashboard.opts)

		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
