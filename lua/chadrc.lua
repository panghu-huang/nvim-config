-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {
  lsp = {
    signature = false,
  },
  base46 = {
    theme = "bearded-arc",
    hl_override = {
      NvDashAscii = {
        fg = 'black',
        bg = 'blue',
      },
      NvDashButtons = {
        fg = 'white',
        bg = 'black2',
      },
    },
  },
}

M.ui = {
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
    order = { "mode", "git", "%=", "cmd", "recording_msg", "diagnostics", "cwd" },
    modules = {
      cmd = function()
        return "%S"
      end,
      recording_msg = function()
        return require('noice').api.status.mode.get()
      end,
    },
  },
  tabufline = {
    order = { "treeOffset", "tabs", "buffers" },
  },
}

return M
