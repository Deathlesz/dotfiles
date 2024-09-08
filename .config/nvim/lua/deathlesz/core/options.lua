vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

-- enable mouse support just in case
opt.mouse = "a"

-- show line number on current line and relative number on other lines
opt.number = true
opt.relativenumber = true

-- don't show the mode since we have a statusline
opt.showmode = false

-- indentation settings
opt.tabstop = 4 -- tab width
opt.shiftwidth = 4 -- indent width
opt.expandtab = true -- tab to spaces
opt.autoindent = true

-- disable line wrapping
opt.wrap = false

-- save undo history
opt.undofile = true

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- ui
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- decrease update time
opt.updatetime = 250

-- decrease mapped sequence wait time
-- displays which-key popup sooner
opt.timeoutlen = 500

-- window split behaviour
opt.splitright = true
opt.splitbelow = true

-- use system clipboard
-- scheduled to be run after 'UiEnter' because it can increase startup-time
vim.schedule(function()
	opt.clipboard:append("unnamedplus")
end)

-- live substitution preview
opt.inccommand = "split"

-- minimal # of lines to keep above/below the cursor
opt.scrolloff = 10
