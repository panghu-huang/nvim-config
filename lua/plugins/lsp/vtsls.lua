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
  },
  ft = FILETYPES,
  opts = {
    filetypes = FILETYPES,
    single_file_support = true,
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
  },
  ---@param _ any
  ---@param opts VtslsConfig
  config = function(_, opts)
    require('lspconfig.configs').vtsls = require('vtsls').lspconfig

    require('lspconfig').vtsls.setup(opts)
  end,
}
