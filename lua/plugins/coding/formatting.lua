return {
  'stevearc/conform.nvim',
  event = 'BufWritePre',
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
      javascript = { 'prettier' },
      typescript = { 'prettier' },
      typescriptreact = { 'prettier' },
      javascriptreact = { 'prettier' },
      html = { 'prettier' },
      css = { 'prettier' },
    },
    formatters = {
      prettier = {
        command = 'prettier',
      }
    },
    format_on_save = {
      timeout_ms = 2500,
      lsp_format = 'first',
    },
  },
}
