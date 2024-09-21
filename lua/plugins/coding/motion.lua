return {
  'ggandor/leap.nvim',
  opts = {},
  keys = {
    {
      '-',
      '<Plug>(leap-forward)',
      desc = 'Leap forward',
      mode = { 'n', 'x', 'o' }
    },
    {
      '_',
      '<Plug>(leap-backward)',
      desc = 'Leap backward',
      mode = { 'n', 'x', 'o' }
    }
  }
}
