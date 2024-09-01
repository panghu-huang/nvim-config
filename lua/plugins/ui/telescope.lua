return {
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  config = function()
    local telescope = require 'telescope'

    local opts = {
      defaults = {
        prompt_prefix = '   ',
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
          'build/',
          '*.log',
        },
        mappings = {
          n = {
            ['q'] = require('telescope.actions').close,
          },
          i = {
            ['<ESC>'] = require('telescope.actions').close,
          },
        },
      },
    }

    telescope.setup(opts)
  end,
}
