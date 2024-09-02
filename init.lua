vim.g.mapleader = ' '

require('ui').setup {
  header = {
    ' ███████████                                █████                ',
    '░░███░░░░░███                              ░░███                 ',
    ' ░███    ░███  ██████   ████████    ███████ ░███████   █████ ████',
    ' ░██████████  ░░░░░███ ░░███░░███  ███░░███ ░███░░███ ░░███ ░███ ',
    ' ░███░░░░░░    ███████  ░███ ░███ ░███ ░███ ░███ ░███  ░███ ░███ ',
    ' ░███         ███░░███  ░███ ░███ ░███ ░███ ░███ ░███  ░███ ░███ ',
    ' █████       ░░████████ ████ █████░░███████ ████ █████ ░░████████',
    '░░░░░         ░░░░░░░░ ░░░░ ░░░░░  ░░░░░███░░░░ ░░░░░   ░░░░░░░░ ',
    '                                   ███ ░███                      ',
    '                                  ░░██████                       ',
    '                                   ░░░░░░                        ',
  },
  buttons = {
    { '  Find File', '<leader><space>', 'Telescope find_files' },
    { '󰈚  Recent Files', 'Spc f o', 'Telescope oldfiles' },
  },
}

require('tools.lazy-nvim').setup {
  colorscheme = 'tokyonight',
  plugins = {
    { import = 'plugins.ui' },
    { import = 'plugins.coding' },
    { import = 'plugins.lsp' },
    { import = 'plugins.treesitter' },
  },
}

require 'options'
require 'autocmds'

vim.cmd [[ colorscheme tokyonight ]]

vim.schedule(function()
  require 'mappings'
end)
