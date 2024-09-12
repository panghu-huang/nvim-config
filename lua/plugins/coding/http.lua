return {
  {
    'mistweaverco/kulala.nvim',
    ft = { 'http' },
    keys = {
      {
        '<leader>ra',
        '<cmd>lua require("kulala").run()<CR>',
        desc = 'Run HTTP request',
      },
      {
        '<leader>rv',
        '<cmd>lua require("kulala").toggle_view()<CR>',
        desc = 'Toggle HTTP response view',
      },
      {
        '<leader>ri',
        '<cmd>lua require("kulala").inspect()<CR>',
        desc = 'Inspect HTTP response',
      }
    }
  }
}
