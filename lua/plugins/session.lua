return {
  "folke/persistence.nvim",
  keys = {
    { '<leader>ss', '<cmd>lua require("persistence").select()<CR>', desc = 'Session search' },
    { '<leader>sr', '<cmd>lua require("persistence").load()<CR>',   desc = 'Session restore' },
  },
  -- this will only start session saving when an actual file was opened
  event = "BufReadPre",
  opts = {
    -- add any custom options here
    need = 0,
  }
}
