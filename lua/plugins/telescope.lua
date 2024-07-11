return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmd = "Telescope",
    config = function(_, opts)
      local telescope = require "telescope"
      local overrides = {
        defaults = {
          file_ignore_patterns = {
            ".git/",
            "node_modules/",
            "target/",
            "coverage/",
            "dist/",
            "build/",
            "*.log",
          },
          vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--ignore-file',
            '.gitignore'
          },
          mappings = {
            i = {
              ["<ESC>"] = require("telescope.actions").close
            }
          }
        }
      }

      telescope.setup(vim.tbl_deep_extend("keep", overrides, opts))
    end,
  },
}
