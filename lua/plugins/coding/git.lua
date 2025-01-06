return {
  'NeogitOrg/neogit',
  cmd = 'Neogit',
  keys = {
    {
      '<leader>gg',
      '<cmd>Neogit<cr>',
      desc = 'Neogit'
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
      finder = {
        ["<tab>"] = "Next",
        ["<s-tab>"] = "Previous",
      }
    },
    integrations = {
      telescope = true,
      diffview = true,
    }
  }
}
