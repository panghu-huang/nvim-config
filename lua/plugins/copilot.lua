local plugings = {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    config = function()
      local NODE20_HOME = os.getenv("NODE20_HOME")

      require("copilot").setup({
        suggestion = {
          enabled = false,
        },
        panel = {
          enabled = false,
        },
        copilot_node_command = NODE20_HOME,
      })
    end
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        dependencies = "copilot.lua",
        config = function()
          require("copilot_cmp").setup()
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
        },
      }

      local merged = vim.tbl_deep_extend("force", opts or {}, overrides)

      return merged
    end,
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end,
  }
}

return plugings
