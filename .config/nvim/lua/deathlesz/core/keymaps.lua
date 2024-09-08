-- set <space> as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

-- fuck arrow keys, all my homies HATE arrow keys
keymap.set("n", "<left>", "<cmd>echo \"Use f*cking 'h' to move!\"<CR>")
keymap.set("n", "<right>", "<cmd>echo \"Use f*cking 'l' to move!\"<CR>")
keymap.set("n", "<up>", "<cmd>echo \"Use f*cking 'k' to move!\"<CR>")
keymap.set("n", "<down>", "<cmd>echo \"Use f*cking 'j' to move!\"<CR>")

-- clear hightlights on search
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- windows
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "[S]plit window [v]ertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "[S]plit window [h]orizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make [s]plits [e]qual size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close [s]plit" })

-- tabs
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "[O]pen new [t]ab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current [t]ab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "[N]ext [t]ab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "[P]revious [t]ab" })

-- hightlight when yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "hightlight when yanking text",
	group = vim.api.nvim_create_augroup("hightlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
