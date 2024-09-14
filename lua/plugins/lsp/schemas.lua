return {
  'b0o/schemastore.nvim',
  ft = { 'json', 'yaml' },
  config = function()
    local lspconfig = require 'lspconfig'
    local capabilities = require 'cmp_nvim_lsp'.default_capabilities()

    lspconfig.jsonls.setup {
      capabilities = capabilities,
      settings = {
        json = {
          schemas = require('schemastore').json.schemas(),
          validate = { enable = true },
        },
      },
    }

    lspconfig.yamlls.setup {
      capabilities = capabilities,
      settings = {
        yaml = {
          schemas = require('schemastore').yaml.schemas(),
          validate = true,
        },
      },
    }
  end,
}
