return {
  {
    'stevearc/overseer.nvim',
    cmd = { "OverseerRun", "OverseerToggle" },
    keys = {
      {
        "<leader>to",
        "<cmd>OverseerToggle<CR>",
        desc = "Toggle overseer",
      },
      {
        "<leader>tr",
        "<cmd>OverseerRun<CR>",
        desc = "Run overseer",
      }
    },
    opts = {
      strategy = "toggleterm",
    },
    dependencies = {
      {
        "stevearc/dressing.nvim",
        opts = {
          inupt = { enabled = false },
        }
      }
    }
  }
}
