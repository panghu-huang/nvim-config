return {
  'akinsho/bufferline.nvim',
  event = 'UIEnter',
  opts = {
    options = {
      mode = 'buffers',
      separator_style = 'slant',
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
