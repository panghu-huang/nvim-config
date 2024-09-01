vim.g.mapleader = ' '

require('tools.lazy-nvim').setup {
  colorscheme = 'tokyonight',
  plugins = {
    { import = 'plugins.ui' },
    { import = 'plugins.coding' },
    { import = 'plugins.lsp' },
  },
}

vim.cmd [[ colorscheme tokyonight ]]

require('theme').setup()

require 'options'

vim.schedule(function()
  require 'mappings'
  require 'autocmds'
end)
