require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'bash',
    'dockerfile',
    'go',
    'html',
    'javascript',
    'json',
    'lua',
    'markdown',
    'python',
    'ruby',
    'sql',
    'toml',
    'terraform',
    'yaml',
    'helm'
  },
  sync_install = true,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
    disable = { "gitcommit"}
  },
  indent = {
    enable = true,
  },
  endwise = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
        ['as'] = { query = '@scope', query_group = 'locals' },
      },
      include_surrounding_whitespace = false,
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        [']f'] = '@function.outer',
        [']c'] = '@class.outer',
      },
      goto_next_end = {
        ['}f'] = '@function.outer',
        ['}c'] = '@class.outer',
      },
      goto_previous_start = {
        ['[f'] = '@function.outer',
        ['[c'] = '@class.outer',
        ['[s'] = { query = '@scope', query_group = 'locals' },
      },
    },
  },
}
