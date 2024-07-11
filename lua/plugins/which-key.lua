return {
  "folke/which-key.nvim",
  config = function()
    local wk = require("which-key")

    wk.register({
        d = {
          name = "Diagnostics",
        },
        b = {
          name = "Buffers",
          a = {
          function()
              require("nvchad.tabufline").closeAllBufs()
            end,
            "Close All Buffers"
          }
        },
        c = {
          name = "Code"
        },
        w = {
          name = "Windows"
        },
        f = {
          name = "Files"
        },
        g = {
          name = "Git"
        },
        t = {
          name = "Theme"
        },
      },
      { prefix = "<leader>" }
    )
  end
}
