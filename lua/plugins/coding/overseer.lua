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
      templates = {
        "npm-workspace",
        "cargo-workspace",
      },
      component_aliases = {
        default = {
          "on_exit_set_status",
          "on_output_quickfix",
          "on_complete_notify",
          {
            "on_complete_dispose",
            require_view = {
              "SUCCESS",
              "FAILURE"
            }
          },
        },
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
