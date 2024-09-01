return {
  'nvim-lualine/lualine.nvim',
  event = 'UIEnter',
  opts = {
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch' },
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {
        {
          'diagnostics',
          colored = false,
          symbols = {
            error = 'E',
            warn = 'W',
            info = 'I',
            hint = 'H',
          },
        },
      },
    },
  },
}
