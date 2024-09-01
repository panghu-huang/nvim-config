return {
  'folke/which-key.nvim',
  keys = { '<leader>' },
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
    },
    win = {
      width = { min = 46, max = 80 },
      height = { min = 2, max = 0.5 },
      col = 1,
      title = true,
      title_pos = 'left',
    },
    layout = {
      width = { min = 50 },
      spacing = 2,
      align = 'left',
    },
    icons = {
      rules = false,
    },
  },
}
