local function handle_attach(bufnr)
  local api = require 'nvim-tree.api'

  local map = vim.keymap.set

  api.config.mappings.default_on_attach(bufnr)

  local function opts(desc)
    return {
      desc = desc,
      buffer = bufnr,
    }
  end

  map('n', 'l', api.node.open.edit, opts 'Open file')
  map('n', 'h', api.node.open.edit, opts 'Open file')
end

return {
  {
    'nvim-tree/nvim-web-devicons',
  },
  {
    'nvim-tree/nvim-tree.lua',
    keys = {
      { '<leader>e', '<cmd>NvimTreeToggle<cr>', desc = 'Toggle nvim tree' },
    },
    opts = {
      on_attach = handle_attach,
      filters = {
        dotfiles = false,
        custom = { '^.git$', 'node_modules' },
      },
      git = {
        timeout = 30000,
      },
      disable_netrw = true,
      hijack_cursor = true,
      sync_root_with_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = false,
      },
      view = {
        width = 40,
        preserve_window_proportions = true,
      },
      renderer = {
        highlight_git = true,
        root_folder_label = false,
        special_files = {},
      },
      filesystem_watchers = {
        enable = true,
        debounce_delay = 1000,
        ignore_dirs = { 'node_modules', '.git', 'dist', 'build', 'target' }
      },
    },
  },
}
