return {
  'folke/which-key.nvim',
  keys = { '<leader>', '[', ']' },
  opts = {
    preset = 'helix',
    spec = {
      { '<leader>d', group = 'Diagnostics' },
      { '<leader>b', group = 'Buffers' },
      { '<leader>c', group = 'Code & Copilot Chat', mode = { 'n', 'v' } },
      { '<leader>cc', group = 'Copilot Chat', mode = { 'n', 'v' } },
      { '<leader>w', group = 'Windows' },
      { '<leader>f', group = 'Files' },
      { '<leader>g', group = 'Git' },
      { '<leader>t', group = 'Theme' },
      { '<leader>v', group = 'Version control' },
      { '<leader>z', group = 'Lazy' },
    },
    icons = {
      rules = false,
    },
  },
}
