return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = vim.fn.executable("make") == 1,
		},
		"folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
			},
		})

		telescope.load_extension("fzf")

		local keymap = vim.keymap
		local builtin = require("telescope.builtin")

		keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [f]iles" })
		keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "[F]ind [s]tring" })
		keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "[F]ind [r]ecent files" })
		keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "[F]ind [T]ODOs" })
	end,
}
