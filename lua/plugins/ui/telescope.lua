return {
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  config = function()
    local telescope = require 'telescope'
    local actions = require('telescope.actions')

    local opts = {
      defaults = {
        -- prompt_prefix = ' 🔍 ',
        selection_caret = ' ',
        entry_prefix = ' ',
        sorting_strategy = 'ascending',
        layout_config = {
          horizontal = {
            prompt_position = 'top',
            preview_width = 0.55,
          },
          width = 0.87,
          height = 0.80,
        },
        file_ignore_patterns = {
          '.git/',
          'node_modules/',
          'target/',
          'coverage/',
          'dist/',
          '*.log',
        },
        mappings = {
          n = {
            ['q'] = actions.close,
          },
          i = {
            ['<ESC>'] = actions.close,
            ['<Tab>'] = actions.move_selection_next,
            ['<S-Tab>'] = actions.move_selection_previous,
          },
        },
        preview = {
          filesize_limit = 0.1, -- in MB
        }
      },
    }

    telescope.setup(opts)
  end,
}
