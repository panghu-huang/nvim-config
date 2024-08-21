return {
  {
    "github/copilot.vim",
    event = { "InsertEnter", "LspAttach" },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      "github/copilot.vim",
      "nvim-lua/plenary.nvim"
    },
    event = "VeryLazy",
    opts = {
      question_header = "## Panghu",
      auto_insert_mode = true,
    },
  }
}
