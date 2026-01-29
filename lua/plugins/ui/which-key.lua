return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    preset = 'helix',
    spec = {
      { '<leader>d', group = 'Diagnostics & Dev' },
      { '<leader>b', group = 'Buffers' },
      { '<leader>c', group = 'Code',                  mode = { 'n', 'v' } },
      { '<leader>k', group = 'Copilot Chat',          mode = { 'n', 'v' } },
      { '<leader>w', group = 'Windows' },
      { '<leader>f', group = 'Files' },
      { '<leader>r', group = 'Registers & Requests' },
      { '<leader>g', group = 'Git' },
      { '<leader>t', group = 'Terminal & Task & TODO' },
      { '<leader>m', group = 'Theme' },
      { '<leader>v', group = 'Version control' },
      { '<leader>z', group = 'Lazy' },
      { '<leader>s', group = 'Sessions' },
      { '<leader>S', group = 'Search' },
    },
    icons = {
      rules = false,
    },
  },
}
