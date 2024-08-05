return {
  'nvimdev/lspsaga.nvim',
  config = function()
    require('lspsaga').setup({
      diagnostic = {
        auto_preview = true,
        keys = {
          exec_action = 'e',
          quit = 'q',
          toggle_or_jump = 'o',
          quit_in_show = { 'q', '<ESC>' },
        },
      },
      lightbulb = {
        enable = false,
      },
      symbol_in_winbar = {
        enable = false,
      },
      outline = {
        layout = "float",
      },
    })
  end,
  event = "VeryLazy",
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  }
}
