return {
  {
    "hrsh7th/nvim-cmp",
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
          { name = "luasnip",  group_index = 2 },
          { name = "buffer",   group_index = 2 },
          { name = "nvim_lua", group_index = 2 },
          { name = "path",     group_index = 2 },
          { name = "crates",   group_index = 2 },
        },
      }

      return vim.tbl_deep_extend("force", opts or {}, overrides)
    end,
    config = function(_, opts)
      local cmp = require("cmp")
      cmp.setup(opts)

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' },
        }, {
          { name = 'cmdline' }
        }),
        matching = { disallow_symbol_nonprefix_matching = true },
      })
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
        enable_update_available_warning = false,
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
