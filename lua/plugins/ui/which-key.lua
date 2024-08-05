return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function(_, opts)
    local wk = require("which-key")

    local overrides = {
      preset = "helix",
      spec = {
        { "<leader>d", group = "Diagnostics" },
        {
          "<leader>ba",
          function()
            require("nvchad.tabufline").closeAllBufs()
          end,
          desc = "Close All Buffers",
          group = "Buffers",
        },
        { "<leader>c", group = "Code" },
        { "<leader>w", group = "Windows" },
        { "<leader>f", group = "Files" },
        { "<leader>g", group = "Git" },
        { "<leader>t", group = "Theme" },
      },
      win = {
        width = { min = 46, max = 80 },
        height = { min = 2, max = 0.5 },
        col = 1,
        title = true,
        title_pos = 'left',
      },
      layout = {
        width = { min = 50 },
        spacing = 2,
        align = "left",
      },
      icons = {
        rules = false,
      },
    }

    local merged = vim.tbl_deep_extend("force", opts or {}, overrides)

    wk.setup(merged)
  end
}
