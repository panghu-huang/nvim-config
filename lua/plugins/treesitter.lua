return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  lazy = false,
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua",
        "bash",
        "html",
        "javascript",
        "typescript",
        "rust",
        "tsx",
        "toml",
        "yaml",
        "json"
      },
      highlight = {
        enable = true,
        use_languagetree = true
      },
      indent = {
        enable = true
      },
      textobjects = {
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]f"] = { query = "@function.outer", desc = "Next Function start" },
            ["]c"] = { query = "@call.outer", desc = "Next Call start" },
            ["]s"] = { query = "@statement.outer", desc = "Next Statement start" },
            ["]b"] = { query = "@block.outer", desc = "Next Block start" },
            ["]a"] = { query = "@parameter.outer", desc = "Next Argument start" },
            ["]l"] = { query = "@loop.outer", desc = "Next Loop start" },
            ["]r"] = { query = "@return.outer", desc = "Next Return start" },
            ["]i"] = { query = "@conditional.outer", desc = "Next Conditional start" },
          },
          goto_previous_start = {
            ["[f"] = { query = "@function.outer", desc = "Previous Function start" },
            ["[c"] = { query = "@call.outer", desc = "Previous Call start" },
            ["[s"] = { query = "@statement.outer", desc = "Previous Statement start" },
            ["[b"] = { query = "@block.outer", desc = "Previous Block start" },
            ["[a"] = { query = "@parameter.outer", desc = "Previous Argument start" },
            ["[l"] = { query = "@loop.outer", desc = "Previous Loop start" },
            ["[r"] = { query = "@return.outer", desc = "Previous Return start" },
            ["[i"] = { query = "@conditional.outer", desc = "Previous Conditional start" },
          },
          goto_next_end = {
            ["]F"] = { query = "@function.outer", desc = "Next Function end" },
            ["]C"] = { query = "@call.outer", desc = "Next Call end" },
            ["]S"] = { query = "@statement.outer", desc = "Next Statement end" },
            ["]B"] = { query = "@block.outer", desc = "Next Block end" },
            ["]A"] = { query = "@parameter.outer", desc = "Next Argument end" },
            ["]L"] = { query = "@loop.outer", desc = "Next Loop end" },
            ["]R"] = { query = "@return.outer", desc = "Next Return end" },
            ["]I"] = { query = "@conditional.outer", desc = "Next Conditional end" },
          },
          goto_previous_end = {
            ["[F"] = { query = "@function.outer", desc = "Previous Function end" },
            ["[C"] = { query = "@call.outer", desc = "Previous Call end" },
            ["[S"] = { query = "@statement.outer", desc = "Previous Statement end" },
            ["[B"] = { query = "@block.outer", desc = "Previous Block end" },
            ["[A"] = { query = "@parameter.outer", desc = "Previous Argument end" },
            ["[L"] = { query = "@loop.outer", desc = "Previous Loop end" },
            ["[R"] = { query = "@return.outer", desc = "Previous Return end" },
            ["[I"] = { query = "@conditional.outer", desc = "Previous Conditional end" },
          },
        },
        select = {
          enable = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["ac"] = "@call.outer",
            ["as"] = "@statement.outer",
            ["ab"] = "@block.outer",
            ["aa"] = "@parameter.outer",
            ["al"] = "@loop.outer",
            ["ar"] = "@return.outer",
            ["ai"] = "@conditional.outer",
            -- inner
            ["if"] = "@function.inner",
            ["ic"] = "@call.inner",
            ["is"] = "@statement.inner",
            ["ib"] = "@block.inner",
            ["ia"] = "@parameter.inner",
            ["il"] = "@loop.inner",
            ["ir"] = "@return.inner",
            ["ii"] = "@conditional.inner",
          }
        }
      }
    })
  end
}
