return {
  {
    'folke/tokyonight.nvim',
    opts = {},
  },
  {
    'oneslash/helix-nvim',
  },
  {
    'catppuccin/nvim',
  },
  {
    'rmehri01/onenord.nvim',
  },
  {
    'zaldih/themery.nvim',
    keys = {
      {
        '<leader>mt',
        '<cmd>Themery<CR>',
        desc = 'Toogle Theme switcher',
      }
    },
    lazy = false,
    opts = {
      themes = {
        {
          name = 'Tokyo Night (Night)',
          colorscheme = 'tokyonight-night',
        },
        {
          name = 'Tokyo Night (Storm)',
          colorscheme = 'tokyonight-storm',
        },
        {
          name = 'Tokyo Night (Moon)',
          colorscheme = 'tokyonight-moon',
        },
        {
          name = 'catppuccin (Frappe)',
          colorscheme = 'catppuccin-frappe',
        },
        {
          name = 'catppuccin (Macchiato)',
          colorscheme = 'catppuccin-macchiato',
        },
        {
          name = 'catppuccin (Mocha)',
          colorscheme = 'catppuccin-mocha',
        },
        {
          name = 'helix',
          colorscheme = 'helix',
        },
        {
          name = 'onenord',
          colorscheme = 'onenord',
        }
      }
    },
  }
}
