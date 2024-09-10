return {
  setup = function()
    require('telescope').setup {
      defaults = {
        path_display = {
          'smart',
        },
        layout_config = {
          prompt_position = 'top',
        },
        mappings = {
          i = {
            ['<C-j>'] = require('telescope.actions').move_selection_next,
            ['<C-k>'] = require('telescope.actions').move_selection_previous,
          },
        },
      },
    }

    telescope.load_extension('fzf')
  end,
}
