return {
  {
    'folke/tokyonight.nvim',
  },
  {
    'catppuccin/nvim',
  },
  {
    'rmehri01/onenord.nvim',
  },
  {
    'navarasu/onedark.nvim',
  },
  {
    'projekt0n/github-nvim-theme',
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
          name = 'One Dark (Dark)',
          colorscheme = 'onedark',
          before = [[
            vim.g.onedark_config = {
              style = 'dark'
            }
          ]],
        },
        {
          name = 'One Dark (Darker)',
          colorscheme = 'onedark',
          before = [[
            vim.g.onedark_config = {
              style = 'darker'
            }
          ]],
        },
        {
          name = 'One Dark (Cool)',
          colorscheme = 'onedark',
          before = [[
            vim.g.onedark_config = {
              style = 'cool'
            }
          ]],
        },
        {
          name = 'One Dark (Deep)',
          colorscheme = 'onedark',
          before = [[
            vim.g.onedark_config = {
              style = 'deep'
            }
          ]],
        },
        {
          name = 'One Dark (Warm)',
          colorscheme = 'onedark',
          before = [[
            vim.g.onedark_config = {
              style = 'warm'
            }
          ]],
        },
        {
          name = 'One Dark (Warmer)',
          colorscheme = 'onedark',
          before = [[
            vim.g.onedark_config = {
              style = 'warmer'
            }
          ]],
        },
        {
          name = 'One Nord',
          colorscheme = 'onenord',
        },
        {
          name = 'GitHub (Dark)',
          colorscheme = 'github_dark',
        },
        {
          name = 'GitHub (Dark Dimmed)',
          colorscheme = 'github_dark_dimmed',
        }
      }
    },
  }
}
