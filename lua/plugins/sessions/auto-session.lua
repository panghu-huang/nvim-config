return {
  'rmagatti/auto-session',
  lazy = false,
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    require('auto-session').setup({
      auto_session_suppress_dirs = { '~/workspaces', '~/projects' },
      session_lens = {
        load_on_setup = false,
        theme_conf = { border = true },
        previewer = false,
      },
    })
  end,
}
