return {
  'OXY2DEV/markview.nvim',
  ft = 'markdown',
  opts = {
    -- modes = { 'n', 'i', 'no', 'c' },
    -- hybrid_modes = { 'i' },
    preview = {
      filetypes = {},
    },
    callbacks = {
      on_enable = function(_, win)
        vim.wo[win].conceallevel = 2
        vim.wo[win].concealcursor = 'nc'
      end,
    },
  },
}
