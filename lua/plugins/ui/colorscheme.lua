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
    'sainnhe/everforest',
  },
  {
    'rose-pine/neovim',
  },
  {
    'dracula/vim',
  },
  {
    'nyoom-engineering/oxocarbon.nvim',
  },
  {
    'rebelot/kanagawa.nvim',
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
        },
        {
          name = 'Rose pine (Moon)',
          colorscheme = 'rose-pine-moon',
        },
        {
          name = 'Rose pine (Dawn)',
          colorscheme = 'rose-pine-dawn',
        },
        {
          name = 'Rose pine (Main)',
          colorscheme = 'rose-pine-main',
        },
        {
          name = 'Dracula',
          colorscheme = 'dracula',
        },
        {
          name = 'Everforest',
          colorscheme = 'everforest',
          before = [[
            vim.g.everforest_background = 'medium'
          ]],
        },
        {
          name = 'Everforest (Hard)',
          colorscheme = 'everforest',
          before = [[
            vim.g.everforest_background = 'hard'
          ]],
        },
        {
          name = 'Everforest (Soft)',
          colorscheme = 'everforest',
          before = [[
            vim.g.everforest_background = 'soft'
          ]],
        },
        {
          name = 'Oxocarbon',
          colorscheme = 'oxocarbon',
        },
        {
          name = 'Kanagawa (Wave)',
          colorscheme = 'kanagawa-wave',
        },
        {
          name = 'Kanagawa (Dragon)',
          colorscheme = 'kanagawa-dragon',
        },
      }
    },
  }
}
