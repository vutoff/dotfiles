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

require("lazy").setup({
 'APZelos/blamer.nvim',
 'junegunn/vim-easy-align',
 'tpope/vim-fugitive',
 'tpope/vim-surround',
 'vim-airline/vim-airline',
 'vim-airline/vim-airline-themes',
 'pearofducks/ansible-vim',
 'hashivim/vim-hashicorp-tools',
 'tpope/vim-commentary',
 'ntpeters/vim-better-whitespace',
 'airblade/vim-gitgutter',
 'k0kubun/vim-open-github',
 'prabirshrestha/async.vim',
 'prabirshrestha/asyncomplete.vim',
 'prabirshrestha/asyncomplete-lsp.vim',
 'prabirshrestha/vim-lsp',
 'neovim/nvim-lspconfig',
 'gabesoft/vim-ags',
 'raimondi/delimitmate',
 'Chiel92/vim-autoformat',
 'yggdroot/indentline',
 'simeji/winresizer',
 'bogado/file-line',
 'Glench/Vim-Jinja2-Syntax',
 'epeli/slimux',
 'jpalardy/vim-slime',
 'zackhsi/fzf-tags',
 'github/copilot.vim',
 'slim-template/vim-slim',
 'nvim-tree/nvim-web-devicons',
 'nvim-tree/nvim-tree.lua',
 { 'vim-ruby/vim-ruby', ft = 'ruby' },
 { 'mg979/vim-visual-multi', branch = 'master'},
 { 'ekalinin/dockerfile.vim', ft = 'docker' },
 { 'nvim-telescope/telescope.nvim', ft = 'yaml' },
 { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
 { 'ibhagwan/fzf-lua',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("fzf-lua").setup({})
    end
  },
 'williamboman/mason.nvim',
 { 'sainnhe/gruvbox-material',
    name = 'gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd 'colorscheme gruvbox-material'
    end
 },
})
