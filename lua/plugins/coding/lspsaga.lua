return {
  'nvimdev/lspsaga.nvim',
  cmd = 'Lspsaga',
  opts = {
    diagnostic = {
      auto_preview = true,
      keys = {
        exec_action = 'e',
        quit = 'q',
        toggle_or_jump = { 'o', 'l' },
        quit_in_show = { 'q', '<ESC>' },
      },
    },
    rename = {
      keys = {
        quit = '<ESC>',
        exec = '<CR>',
      },
    },
    lightbulb = {
      enable = false,
    },
    symbol_in_winbar = {
      enable = false,
    },
    outline = {
      layout = 'float',
      toggle_or_jump = { 'o', 'l' },
      detail = false,
    },
  },
}
