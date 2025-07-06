return {
  'rmagatti/auto-session',
  lazy = false,
  keys = {
    { '<leader>ss', '<cmd>SessionSearch<CR>',  desc = 'Session search' },
    { '<leader>sr', '<cmd>SessionRestore<CR>', desc = 'Session restore' },
  },
  opts = {
    session_lens = {
      theme_conf = { border = true },
      previewer = false,
      mappings = {
        delete_session = { "i", "<C-c>" }
      },
    },
  },
}
