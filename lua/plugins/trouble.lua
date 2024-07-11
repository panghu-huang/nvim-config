return {
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    config = function ()
      require("trouble").setup {
        auto_preview = false,
        auto_fold = true,
        auto_close = true,
        auto_loc_list = true,
        auto_loclist = true,
        auto_quickfix = true,
        auto_focus = true,
        signs = {
          error = "",
          warning = "",
          hint = "",
          information = "",
        },
        use_lsp_diagnostic_signs = true,
      }
    end,
    keys = {
      {
        "<leader>dw",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics",
      },
      {
        "<leader>dl",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List",
      },
      {
        "<leader>dq",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List",
      },
    }
  }
}
