return {
  "stevearc/conform.nvim",
  event = 'BufWritePre',
  config = function()
    local options = {
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        javascriptreact = { "prettier" },
      },
      format_on_save = {
        timeout_ms = 2500,
        lsp_format = 'fallback',
      },
    }

    require("conform").setup(options)
  end,
}
