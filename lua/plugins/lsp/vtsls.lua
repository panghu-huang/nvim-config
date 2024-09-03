local FILETYPES = {
  'javascript',
  'javascriptreact',
  'javascript.jsx',
  'typescript',
  'typescriptreact',
  'typescript.tsx',
}

return {
  'yioneko/nvim-vtsls',
  dependencies = {
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
  },
  ft = FILETYPES,
  opts = function()
    local capabilities = require 'cmp_nvim_lsp'.default_capabilities()

    return {
      filetypes = FILETYPES,
      single_file_support = true,
      capabilities = capabilities,
      settings = {
        typescript = {
          suggest = {
            completionFunctionCalls = true,
          },
          inlayHints = false,
          tsserver = {
            pluginPaths = { '.' },
          },
        },
        vtsls = {
          autoUseWorkspaceTsdk = true,
        },
      },
    }
  end,
  config = function(_, opts)
    require('lspconfig.configs').vtsls = require('vtsls').lspconfig

    require('lspconfig').vtsls.setup(opts)
  end,
}
