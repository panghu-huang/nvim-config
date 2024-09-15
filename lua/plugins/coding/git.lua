return {
  'NeogitOrg/neogit',
  cmd = 'Neogit',
  keys = {
    {
      '<leader>gg',
      '<cmd>Neogit<cr>',
      desc = 'Neogit'
    },
    {
      '<leader>gp',
      '<cmd>Neogit commit<cr>',
      desc = 'Neogit commit'
    }
  },
  opts = {
    mappings = {
      commit_editor = {
        ["<C-s>"] = "Submit",
        ["<C-c>"] = "Abort",
      },
      commit_editor_I = {
        ["<C-s>"] = "Submit",
        ["<C-c>"] = "Abort",
      },
    }
  }
}
