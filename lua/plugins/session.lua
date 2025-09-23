return {
  'rmagatti/auto-session',
  event = 'VeryLazy',
  cmd = { "AutoSession" },
  keys = {
    { '<leader>ss', '<cmd>AutoSession search<CR>',  desc = 'Session search' },
    { '<leader>sr', '<cmd>AutoSession restore<CR>', desc = 'Session restore' },
  },
  opts = {
    auto_restore = false,
    cwd_change_handling = true,
    auto_delete_empty_sessions = false,
    continue_restore_on_error = false,
    session_lens = {
      session_lens = {
        mappings = {
          delete_session = { "i", "<C-c>" }
        },
        picker_opts = {
          border = true,
          previewer = false
        },
        previewer = false
      }
    },
  },
}
