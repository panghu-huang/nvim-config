return {
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
}
