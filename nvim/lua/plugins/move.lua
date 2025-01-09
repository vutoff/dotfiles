require('mini.move').setup({
  -- Module mappings. Use `''` (empty string) to disable one.
  mappings = {
    -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
    left = '<M-Left>',
    right = '<M-Right>',
    down = '<M-Down>',
    up = '<M-Up>',

    -- Move current line in Normal mode
    line_left = '<M-S-Left>',
    line_right = '<M-S-Right>',
    line_down = '<M-S-Down>',
    line_up = '<M-S-Up>',
  },

  -- Options which control moving behavior
  options = {
    -- Automatically reindent selection during linewise vertical move
    reindent_linewise = true,
  },
})
