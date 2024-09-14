return {
  'akinsho/toggleterm.nvim',
  cmd = "ToggleTerm",
  keys = {
    {
      "<C-/>",
      "<cmd>ToggleTerm direction=float name=Terminal<CR>",
      desc = "Toggle terminal",
      mode = { "n", "t" }
    }
  },
  opts = {
    start_in_insert = true,
    float_opts = {
      title_pos = 'center',
    },
    on_open = function()
      local map = function(mode, lhs, rhs, opts)
        local merged = vim.tbl_extend('force', {
          buffer = true,
        }, opts)

        vim.keymap.set(mode, lhs, rhs, merged)
      end

      map('t', '<C-x>', [[<C-\><C-n>]], { desc = "Terminal escape terminal mode" })
      map('t', 'jj', [[<C-\><C-n>]], { desc = "Terminal escape terminal mode" })
    end
  },
}
