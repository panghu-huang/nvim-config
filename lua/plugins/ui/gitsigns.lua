return {
  'lewis6991/gitsigns.nvim',
  event = 'VeryLazy',
  keys = {
    {
      '<leader>gh',
      '<cmd>lua require"gitsigns".preview_hunk_inline()<CR>',
      desc = 'Toggle Git Hunk Preview',
    },
  },
  opts = {},
}
