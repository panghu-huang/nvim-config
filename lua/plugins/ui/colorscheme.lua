return {
  {
    'folke/tokyonight.nvim',
    lazy = vim.g.colorscheme ~= 'tokyonight',
    priority = 1000,
    opts = {},
  },
  {
    'oneslash/helix-nvim',
    lazy = vim.g.colorscheme ~= 'helix',
    -- lazy = false,
  },
  {
    'catppuccin/nvim',
    lazy = vim.g.colorscheme ~= 'catppuccin',
    priority = 1000,
  },
  {
    'rmehri01/onenord.nvim',
    lazy = vim.g.colorscheme ~= 'onenord',
    priority = 1000,
  },
  {
    'oxfist/night-owl.nvim',
    lazy = vim.g.colorscheme ~= 'night-owl',
    priority = 1000,
  }
}
