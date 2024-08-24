return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    require("noice").setup({
      lsp = {
        progress = {
          enabled = false,
        },
        hover = {
          enabled = false,
        },
        signature = {
          enabled = false,
        },
        message = {
          view = "mini",
        },
      },
      health = {
        checker = false,
      },
      presets = {
        -- bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
      },
      notify = {
        enabled = true,
        view = "mini",
      },
      messages = {
        enabled = true,
        view = "mini",
        view_warn = "mini",
        view_error = "mini",
      },
      popupmenu = {
        enabled = true,
      },
      routes = {
        {
          filter = {
            any = {
              { find = "已写入" },
              { find = "written" },
            }
          },
        },
      },
      views = {
        mini = {
          timeout = 3000,
        },
      },
    })
  end,
}
