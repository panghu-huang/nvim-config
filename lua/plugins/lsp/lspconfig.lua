return {
  'neovim/nvim-lspconfig',
  event = 'UIEnter',
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
