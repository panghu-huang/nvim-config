return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  opts = {
    theme = 'doom',
    config = {
      header = {
        '                                                                 ',
        '                                                                 ',
        '                                                                 ',
        '                                                                 ',
        '                                                                 ',
        '                                                                 ',
        '                                                                 ',
        '                                                                 ',
        '                                                                 ',
        '                                                                 ',
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
        '                                                                 ',
        '                                                                 ',
        '                                                                 ',
        '                                                                 ',
        '                                                                 ',
      },
      project = {
        enable = false,
      },
      mru = {
        limit = 6,
        cwd_only = true,
      },
      footer = {
      },
      shortcut = {},
      center = {
        {
          key = 'r',
          icon = '   ',
          action = 'SessionRestore',
          desc = 'Restore session              ',
        },
        {
          key = 'f',
          icon = '󰍲   ',
          action = 'Telescope find_files',
          desc = 'Find file',
        },
        {
          key = 'o',
          icon = '   ',
          action = 'Telescope oldfiles',
          desc = 'Recent files',
        },
        {
          key = 's',
          icon = '   ',
          action = 'SessionSearch',
          desc = 'Search session              ',
        },
        {
          key = 'q',
          icon = '󰛓   ',
          action = 'quit',
          desc = 'Quit              ',
        },
      }
    }
  },
}
