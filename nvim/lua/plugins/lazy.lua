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
{
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      css = { 'prettier' },
      go = { 'gofmt', 'goimports' },
      graphql = { 'prettier' },
      javascript = { 'prettier' },
      json = { 'prettier' },
      lua = { 'stylua' },
      markdown = { 'prettier' },
      python = function(bufnr)
        if require('conform').get_formatter_info('ruff_format', bufnr).available then
          return { 'ruff_format' }
        else
          return { 'black', 'isort' }
        end
      end,
      sql = { 'sqlfluff' },
      scss = { 'prettier' },
      toml = { 'prettier' },
      typescript = { 'prettier' },
      typescriptreact = { 'prettier' },
      -- yaml = { 'prettier' },
      zsh = { 'beautysh' },
    },
    format_on_save = {
      timeout_ms = 1000,
    },
  },
},
{
  "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
    end
},
{
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration

    -- Only one of these is needed, not both.
    "nvim-telescope/telescope.nvim", -- optional
    "ibhagwan/fzf-lua",              -- optional
  },
  config = true
},
{
  'EvWilson/slimux.nvim',
  config = function()
    local slimux = require('slimux')
    slimux.setup({
      target_socket = slimux.get_tmux_socket(),
      target_pane = string.format('%s.2', slimux.get_tmux_window()),
    })
    vim.keymap.set('v', '<leader>ht', slimux.send_highlighted_text,
      { desc = 'Send currently highlighted text to configured tmux pane' })
    vim.keymap.set('n', '<leader>sl', slimux.send_paragraph_text,
      { desc = 'Send paragraph under cursor to configured tmux pane' })
  end
},
{'echasnovski/mini.move', version = '*'}

})
