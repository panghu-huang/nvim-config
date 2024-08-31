return {
  'williamboman/mason.nvim',
  cmd = 'Mason',
  opts = {
    ensure_installed = {
      'lua-language-server',
      'stylua',
      'html-lsp',
      'css-lsp',
      'prettier',
    },
  },
}
