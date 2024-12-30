return {
  'folke/todo-comments.nvim',
  event = 'VeryLazy',
  keys = {
    {
      "<leader>td",
      "<cmd>TodoFzfLua<CR>",
      desc = "Search Todos",
    }
  },
  opts = {},
}
