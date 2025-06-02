return {
  'rmagatti/auto-session',
  cmd = { "SessionRestore", "SessionSearch" },
  keys = {
    { '<leader>ss', '<cmd>SessionSearch<CR>',  desc = 'Session search' },
    { '<leader>sr', '<cmd>SessionRestore<CR>', desc = 'Session restore' },
  },
  opts = {
    allowed_dirs = { '~/workspaces', '~/projects', '~/.config' },
    auto_save = true,
    auto_create = true,
    auto_restore = false,
    session_lens = {
      load_on_setup = false,
      theme_conf = { border = true },
      previewer = false,
      mappings = {
        delete_session = { "i", "<C-c>" }
      },
    },
  },
}
