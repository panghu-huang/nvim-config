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
      "default-title",
      fzf_colors = true,
      fzf_opts = {
        ["--no-scrollbar"] = true,
        ["--cycle"] = true,
      },
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
          false,
          ['<Tab>'] = 'down',
          ['<S-Tab>'] = 'up',
          ['<C-f>'] = 'preview-page-down',
          ['<C-b>'] = 'preview-page-up',
          ['<C-d>'] = 'preview-half-page-down',
          ['<C-u>'] = 'preview-half-page-up'
        },
        fzf = {
          false,
          ['tab'] = 'down',
          ['shift-tab'] = 'up',
          ['ctrl-f'] = 'preview-page-down',
          ['ctrl-b'] = 'preview-page-up',
          ['ctrl-d'] = 'preview-half-page-down',
          ['ctrl-u'] = 'preview-half-page-up'
        }
      },
      files = {
        cwd_prompt = false,
      },
      grep = {
        rg_opts =
        "-g '!**/resources/apps/**/*.js' -g '!**/fixtures/**/*.js' --column --line-number --no-heading --color=always --smart-case --max-columns=4096 -e"
      }
    },
  },
}
