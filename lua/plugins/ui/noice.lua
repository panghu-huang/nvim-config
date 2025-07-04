return {
  'folke/noice.nvim',
  event = 'VeryLazy',
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
      long_message_to_split = false,
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
            { find = 'No information available' },
            -- Ignore deprecated messages from markview.nvim
            { find = 'is deprecated. Use' },
            { find = 'Request getCompletions failed with message' },
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
