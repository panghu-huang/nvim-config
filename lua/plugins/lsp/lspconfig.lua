return {
  'neovim/nvim-lspconfig',
  event = 'UIEnter',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
  },
  config = function()
    local capabilities = require 'cmp_nvim_lsp'.default_capabilities()

    vim.lsp.enable('ts_ls')
    vim.lsp.config('ts_ls', {
      capabilities = capabilities,
    })

    vim.lsp.enable('html')
    vim.lsp.config('html', {
      capabilities = capabilities,
    })

    vim.lsp.enable('prismals')
    vim.lsp.config('prismals', {
      capabilities = capabilities,
    })

    vim.lsp.enable('eslint')
    vim.lsp.config('eslint', {
      capabilities = capabilities,
    })

    vim.lsp.enable('lua_ls')
    vim.lsp.config('lua_ls', {
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
    })
  end,
}
