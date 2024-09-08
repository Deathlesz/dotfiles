local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local stdout = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. stdout)
	end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ { import = "deathlesz.plugins" }, { import = "deathlesz.plugins.lsp" } }, {
	install = { colorscheme = { "gruvbox" } },
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = { notify = false },
})
