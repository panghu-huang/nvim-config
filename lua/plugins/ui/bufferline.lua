return {
  'akinsho/bufferline.nvim',
  event = 'UIEnter',
  opts = {
    options = {
      mode = 'buffers',
      separator_style = 'slant',
      always_show_bufferline = true,
      show_buffer_close_icons = false,
      offsets = {
        {
          filetype = 'NvimTree',
          -- text = '  File Explorer',
          text_align = 'left',
          separator = true,
        },
      },
    },
  },
}
