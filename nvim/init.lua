-- Generic Options --
-- These must stay ahead of `config.lazy`: the leader is baked into plugin
-- keymaps at spec time, and airline reads its globals when it loads.
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- vim.opt.guifont = { "MesloGL Nerd Font", "h14" }
vim.g.airline_powerline_fonts = 1

vim.filetype.pluginindent = true

vim.opt.number = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt_local.colorcolumn = "80"

require("config.lazy")
require("config.lsp")
require("config.options")
require("config.mappings")
