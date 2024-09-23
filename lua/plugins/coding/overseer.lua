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
      templates = {
        "npm-workspace",
        "cargo-workspace",
      },
    },
    dependencies = {
      {
        "stevearc/dressing.nvim",
        opts = {
          inupt = { enabled = false },
        }
      },
      {
        'panghu-huang/workspaces.nvim',
        -- dir = '~/workspaces/workspaces.nvim',
      }
    }
  },
}
