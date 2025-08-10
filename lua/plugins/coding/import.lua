return {
  'piersolenski/import.nvim',
  opts = {
    picker = "telescope",
  },
  keys = {
    {
      "<leader>ci",
      function()
        require("import").pick()
      end,
      desc = "Import module",
    },
  },
}
