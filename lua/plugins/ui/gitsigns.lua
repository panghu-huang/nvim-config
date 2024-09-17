return {
  'lewis6991/gitsigns.nvim',
  event = 'VeryLazy',
  keys = {
    {
      '<leader>gh',
      '<cmd>lua require"gitsigns".preview_hunk_inline()<CR>',
      desc = 'Toggle Git Hunk Preview',
    },
    {
      '<leader>gs',
      '<cmd>lua require"gitsigns".stage_hunk()<CR>',
      desc = 'Stage Git Hunk',
    }
  },
  opts = {
    -- Disable the default keybindings
    on_attach = function() end,
  },
}
