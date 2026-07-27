-- Lazy loading --
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Every module under `lua/plugins/` is imported and must return a plugin spec
-- (or a list of them). Add a plugin by dropping a new file in there; nothing
-- needs to be registered here.
require("lazy").setup({
	{ import = "plugins" },
})
