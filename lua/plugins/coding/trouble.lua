return {
  "folke/trouble.nvim",
  opts = {
    focus = true,
    modes = {
      lsp_references = {
        desc = "References",
        focus = true,
        win = {
          position = "right",
          size = {
            width = 0.3,
          }
        }
      },
      symbols = {
        desc = "Document Symbols",
        focus = true,
        win = {
          position = "right",
          size = {
            width = 0.35,
          }
        },
        filter = {
          any = {
            kind = {
              "Class",
              "Constructor",
              "Enum",
              -- "Field",
              "Function",
              "Interface",
              "Method",
              "Module",
              "Namespace",
              "Package",
              -- "Property",
              "Struct",
              "Trait",
            }
          }
        }
      }
    }
  },
  cmd = "Trouble",
  keys = {
    {
      "<leader>ql",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Location List",
    },
    {
      "<leader>qf",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix List",
    },
  },
}
