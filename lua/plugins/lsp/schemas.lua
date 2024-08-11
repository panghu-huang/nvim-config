return {
  "b0o/schemastore.nvim",
  event = "VeryLazy",
  config = function()
    local lspconfig = require("lspconfig")

    lspconfig.jsonls.setup {
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true }
        },
      },
    }

    lspconfig.yamlls.setup {
      settings = {
        yaml = {
          schemas = require("schemastore").yaml.schemas(),
          validate = true,
        },
      },
    }
  end,
}