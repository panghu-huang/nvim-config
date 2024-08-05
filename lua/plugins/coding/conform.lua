return {
  "stevearc/conform.nvim",
  event = 'BufWritePre',
  config = function()
    local options = {
      formatters_by_ft = {
        lua = { "stylua" },
      },
    }

    require("conform").setup(options)
  end,
}
