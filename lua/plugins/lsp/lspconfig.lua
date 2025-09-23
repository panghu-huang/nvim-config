return {
  'neovim/nvim-lspconfig',
  event = 'UIEnter',
  -- lspconfig deprecated framework/configs after this commit, should use vim.lsp.config
  -- but using vim.lsp.config causes frequent lsp server crashes, so temporarily fix the commit
  commit = '33e318a3f0e729fb7ee82619a21172712b0ea288',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
  },
  config = function()
    local lspconfig = require 'lspconfig'
    local capabilities = require 'cmp_nvim_lsp'.default_capabilities()

    lspconfig.html.setup {
      capabilities = capabilities,
    }

    lspconfig.prismals.setup {
      capabilities = capabilities,
    }

    lspconfig.eslint.setup {
      capabilities = capabilities,
    }

    lspconfig.lua_ls.setup {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
          workspace = {
            library = {
              vim.fn.expand '$VIMRUNTIME/lua',
              vim.fn.expand '$VIMRUNTIME/lua/vim/lsp',
              vim.fn.stdpath 'data' .. '/lazy/lazy.nvim/lua/lazy',
            },
            maxPreload = 100000,
            preloadFileSize = 10000,
          },
        },
      },
    }
  end,
}
