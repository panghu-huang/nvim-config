return {
  {
    "ibhagwan/fzf-lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      {
        "junegunn/fzf", build = "./install --bin"
      }
    },
    cmd = 'FzfLua',
    opts = {
      winopts = {
        width = 0.9,
        height = 0.8,
        treesitter = {
          enabled = true,
        },
        preview = {
          horizontal = 'right:40%',
        },
      },
      keymap = {
        builtin = {
          ['<C-d>'] = 'preview-page-down',
          ['<C-u>'] = 'preview-page-up'
        }
      },
      files = {
        cwd_prompt = false,
      }
    },
  },
}
