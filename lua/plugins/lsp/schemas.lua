return {
  'b0o/schemastore.nvim',
  ft = { 'json', 'yaml' },
  config = function()
    local capabilities = require 'cmp_nvim_lsp'.default_capabilities()

    vim.lsp.enable('jsonls')
    vim.lsp.config('jsonls', {
      capabilities = capabilities,
      settings = {
        json = {
          schemas = require('schemastore').json.schemas(),
          validate = { enable = true },
        },
      },
    })

    vim.lsp.enable('yamlls')
    vim.lsp.config('yamlls', {
      capabilities = capabilities,
      settings = {
        yaml = {
          schemas = require('schemastore').yaml.schemas(),
          validate = true,
          -- format = {
          --   enable = true,
          -- },
        },
      },
    })
  end,
}
