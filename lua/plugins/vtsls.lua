local FILETYPES = {
  "javascript",
  "javascriptreact",
  "javascript.jsx",
  "typescript",
  "typescriptreact",
  "typescript.tsx",
}

return {
  "yioneko/nvim-vtsls",
  dependencies = {
    "neovim/nvim-lspconfig",
  },
  enabled = true,
  ft = FILETYPES,
  opts = function()
    local on_attach = require("nvchad.configs.lspconfig").on_attach
    local on_init = require("nvchad.configs.lspconfig").on_init
    local capabilities = require("nvchad.configs.lspconfig").capabilities

    ---@class VtslsConfig
    return {
      filetypes = FILETYPES,
      on_attach = on_attach,
      on_init = on_init,
      capabilities = capabilities,
      single_file_support = true,
      settings = {
        typescript = {
          suggest = {
            completionFunctionCalls = true,
          },
          inlayHints = false,
          tsserver = {
            pluginPaths = { "." },
          },
        },
        vtsls = {
          autoUseWorkspaceTsdk = true,
        },
      },
    }
  end,

  ---@param _ any
  ---@param opts VtslsConfig
  config = function(_, opts)
    require("lspconfig.configs").vtsls = require("vtsls").lspconfig

    require("lspconfig").vtsls.setup(opts)
  end,
}
