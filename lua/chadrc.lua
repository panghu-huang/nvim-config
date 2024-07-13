-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "github_dark",
  nvdash = {
    load_on_startup = true,
    buttons = {
      { "  Find File", "<leader><space>", "Telescope find_files" },
      { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
    },
    header = {
      " ███████████                                █████                ",
      "░░███░░░░░███                              ░░███                 ",
      " ░███    ░███  ██████   ████████    ███████ ░███████   █████ ████",
      " ░██████████  ░░░░░███ ░░███░░███  ███░░███ ░███░░███ ░░███ ░███ ",
      " ░███░░░░░░    ███████  ░███ ░███ ░███ ░███ ░███ ░███  ░███ ░███ ",
      " ░███         ███░░███  ░███ ░███ ░███ ░███ ░███ ░███  ░███ ░███ ",
      " █████       ░░████████ ████ █████░░███████ ████ █████ ░░████████",
      "░░░░░         ░░░░░░░░ ░░░░ ░░░░░  ░░░░░███░░░░ ░░░░░   ░░░░░░░░ ",
      "                                   ███ ░███                      ",
      "                                  ░░██████                       ",
      "                                   ░░░░░░                        ",
    },
  },
  statusline = {
    theme = "default",
    order = { "mode", "file", "git", "%=", "lsp_msg", "diagnostics", "cwd" },
  },
  tabufline = {
    order = { "treeOffset", "tabs", "buffers" },
  },
}

return M
