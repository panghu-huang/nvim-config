local function set_leap_hl_dark()
  vim.api.nvim_set_hl(0, "LeapBackdrop", {
    fg = "#545c7e",
    nocombine = true,
  })

  vim.api.nvim_set_hl(0, "LeapLabel", {
    fg = "#ff007c",
    bold = true,
    nocombine = true,
  })

  vim.api.nvim_set_hl(0, "LeapMatch", {
    fg = "#c8d3f5",
    bg = "#ff007c",
    bold = true,
    nocombine = true,
  })
end

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
          after = set_leap_hl_dark,
        },
        {
          name = 'catppuccin (Macchiato)',
          colorscheme = 'catppuccin-macchiato',
          after = set_leap_hl_dark,
        },
        {
          name = 'catppuccin (Mocha)',
          colorscheme = 'catppuccin-mocha',
          after = set_leap_hl_dark,
        },
        {
          name = 'One Dark (Dark)',
          colorscheme = 'onedark',
          before = function()
            vim.g.onedark_config = {
              style = 'dark'
            }
          end,
          after = set_leap_hl_dark,
        },
        {
          name = 'One Dark (Darker)',
          colorscheme = 'onedark',
          before = function()
            vim.g.onedark_config = {
              style = 'darker'
            }
          end,
          after = set_leap_hl_dark,
        },
        {
          name = 'One Dark (Cool)',
          colorscheme = 'onedark',
          before = function()
            vim.g.onedark_config = {
              style = 'cool'
            }
          end,
          after = set_leap_hl_dark,
        },
        {
          name = 'One Dark (Deep)',
          colorscheme = 'onedark',
          before = function()
            vim.g.onedark_config = {
              style = 'deep'
            }
          end,
          after = set_leap_hl_dark,
        },
        {
          name = 'One Dark (Warm)',
          colorscheme = 'onedark',
          before = function()
            vim.g.onedark_config = {
              style = 'warm'
            }
          end,
          after = set_leap_hl_dark,
        },
        {
          name = 'One Dark (Warmer)',
          colorscheme = 'onedark',
          before = function()
            vim.g.onedark_config = {
              style = 'warmer'
            }
          end,
          after = set_leap_hl_dark,
        },
        {
          name = 'One Nord',
          colorscheme = 'onenord',
          after = set_leap_hl_dark,
        },
        {
          name = 'GitHub (Dark)',
          colorscheme = 'github_dark',
          after = set_leap_hl_dark,
        },
        {
          name = 'GitHub (Dark Dimmed)',
          colorscheme = 'github_dark_dimmed',
          after = set_leap_hl_dark,
        },
        {
          name = 'Dracula',
          colorscheme = 'dracula',
          after = set_leap_hl_dark,
        },
        {
          name = 'Nightfox (Nightfox)',
          colorscheme = 'nightfox',
          after = set_leap_hl_dark,
        },
        {
          name = 'Nightfox (Duskfox)',
          colorscheme = 'duskfox',
          after = set_leap_hl_dark,
        },
        {
          name = 'Nightfox (Nordfox)',
          colorscheme = 'nordfox',
          after = set_leap_hl_dark,
        }
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
    'dracula/vim',
  },
  {
    'EdenEast/nightfox.nvim'
  }
}
