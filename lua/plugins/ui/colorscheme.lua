return {
  {
    'panghu-huang/theme-picker.nvim',
    -- dir = '~/workspaces/theme-picker.nvim',
    lazy = false,
    opts = {
      picker = {
        layout_config = {
          width = 0.35,
          height = 0.5,
        },
      },
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
          before = function()
            vim.g.onedark_config = {
              style = 'dark'
            }
          end,
        },
        {
          name = 'One Dark (Darker)',
          colorscheme = 'onedark',
          before = function()
            vim.g.onedark_config = {
              style = 'darker'
            }
          end,
        },
        {
          name = 'One Dark (Cool)',
          colorscheme = 'onedark',
          before = function()
            vim.g.onedark_config = {
              style = 'cool'
            }
          end,
        },
        {
          name = 'One Dark (Deep)',
          colorscheme = 'onedark',
          before = function()
            vim.g.onedark_config = {
              style = 'deep'
            }
          end,
        },
        {
          name = 'One Dark (Warm)',
          colorscheme = 'onedark',
          before = function()
            vim.g.onedark_config = {
              style = 'warm'
            }
          end,
        },
        {
          name = 'One Dark (Warmer)',
          colorscheme = 'onedark',
          before = function()
            vim.g.onedark_config = {
              style = 'warmer'
            }
          end,
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
          before = function()
            vim.g.everforest_background = 'medium'
          end,
        },
        {
          name = 'Everforest (Hard)',
          colorscheme = 'everforest',
          before = function()
            vim.g.everforest_background = 'hard'
          end,
        },
        {
          name = 'Everforest (Soft)',
          colorscheme = 'everforest',
          before = function()
            vim.g.everforest_background = 'soft'
          end,
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
  },
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
}
