return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        dependencies = "copilot.lua",
        config = function(_, opts)
          local merged = vim.tbl_deep_extend("force", opts, {
            fix_pairs = true,
          })

          require("copilot_cmp").setup(merged)
        end,
      },
    },
    opts = function(_, opts)
      local cmp = require("cmp")

      local overrides = {
        auto_brackets = {},
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        preselect = cmp.PreselectMode.Item,
        sources = {
          { name = "nvim_lsp", group_index = 2 },
          { name = "copilot",  group_index = 2 },
          { name = "luasnip",  group_index = 2 },
          { name = "buffer",   group_index = 2 },
          { name = "nvim_lua", group_index = 2 },
          { name = "path",     group_index = 2 },
          { name = "crates",   group_index = 2 },
        },
      }

      return vim.tbl_deep_extend("force", opts or {}, overrides)
    end,
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },
  {
    'saecki/crates.nvim',
    tag = 'stable',
    event = 'BufRead Cargo.toml',
    config = function()
      require('crates').setup({
        completion = {
          cmp = {
            enabled = true,
          },
        },
        popup = {
          autofocus = true,
        },
      })
    end,
  }
}
