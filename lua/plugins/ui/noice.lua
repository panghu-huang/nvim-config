return {
  'folke/noice.nvim',
  event = 'UIEnter',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
  opts = {
    lsp = {
      progress = {
        enabled = true,
      },
      hover = {
        enabled = false,
      },
      signature = {
        enabled = false,
      },
      message = {
        view = 'mini',
      },
    },
    health = {
      checker = false,
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = false,
      lsp_doc_border = false,
    },
    notify = {
      enabled = true,
      view = 'mini',
    },
    cmdline = {
      enabled = true,
      view = 'cmdline',
    },
    messages = {
      enabled = true,
      view = 'mini',
      view_warn = 'mini',
      view_error = 'mini',
    },
    popupmenu = {
      enabled = true,
    },
    routes = {
      {
        filter = {
          any = {
            { find = '已写入' },
            { find = 'written' },
          },
        },
      },
    },
    views = {
      mini = {
        timeout = 3000,
      },
    },
  },
}
