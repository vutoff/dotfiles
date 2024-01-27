-- Generic Options --
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- vim.opt.guifont = { "MesloGL Nerd Font", "h14" }
vim.g.airline_powerline_fonts = 1

vim.filetype.pluginindent = true

vim.opt.number = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true

require 'plugins'
require 'lsp'
require 'options'
require 'mappings'
