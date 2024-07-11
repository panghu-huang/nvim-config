local function handle_attach(bufnr)
  local api = require("nvim-tree.api")

  local map = vim.keymap.set

  api.config.mappings.default_on_attach(bufnr)

  local function opts(desc)
    return {
      desc = desc,
      buffer = bufnr,
    }
  end

  map("n", "l", api.node.open.edit, opts("Open file"))
  map("n", "h", api.node.open.edit, opts("Open file"))
end

return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function(_, opts)
      local override = {
        on_attach = handle_attach,
      }

      local merged = vim.tbl_extend("force", override, opts)

      require("nvim-tree").setup(merged)
    end,
  }
}
