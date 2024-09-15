local function recording_msg()
  local recording_register = vim.fn.reg_recording()

  if recording_register == '' then
    return ''
  end

  return 'Recording @' .. recording_register
end

return {
  'nvim-lualine/lualine.nvim',
  event = 'UIEnter',
  opts = {
    options = {
      globalstatus = true,
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch' },
      lualine_c = {},
      lualine_x = { '%S' },
      lualine_y = {
        recording_msg,
        {
          'diagnostics',
          sources = { 'nvim_lsp', 'nvim_workspace_diagnostic', 'nvim_diagnostic' },
          colored = false,
          symbols = {
            error = 'E',
            warn = 'W',
            info = 'I',
            hint = 'H',
          },
        },
      },
      lualine_z = {
        'location',
        {
          'progress',
          color = { gui = 'bold' },
        },
      },
    },
  },
}
