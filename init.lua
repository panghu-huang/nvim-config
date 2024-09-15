vim.g.mapleader = ' '

require('tools.lazy-nvim').setup {
  -- colorscheme = 'catppuccin',
  plugins = {
    { import = 'plugins.ui' },
    { import = 'plugins.coding' },
    { import = 'plugins.lsp' },
    { import = 'plugins.treesitter' },
    { import = 'plugins.session' },
  },
}

require 'options'
require 'autocmds'

vim.schedule(function()
  -- require('ui').setup {}
  require 'mappings'
end)
