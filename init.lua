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
    { ' Restore session', 'Spc s r', 'SessionRestore' },
  },
}

require('tools.lazy-nvim').setup {
  colorscheme = 'tokyonight',
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
  require 'mappings'
end)
