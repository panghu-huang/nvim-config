-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
local web_devicons = require('nvim-web-devicons')

---@type ChadrcConfig
local M = {
  lsp = {
    signature = false,
  },
  base46 = {
    theme = "bearded-arc",
    transparency = true,
    hl_add = {
      St_git_branch = {
        fg = '#807f7f',
        bg = 'NONE',
      },
      St_custom_module = {
        fg = 'whte',
        bg = 'NONE',
      },
    },
    hl_override = {
      NvDashAscii = {
        fg = 'black',
        bg = 'blue',
      },
      NvDashButtons = {
        fg = 'white',
        bg = 'black2',
      },
      St_EmptySpace = {
        fg = 'NONE',
        bg = 'NONE',
      },
      St_LspMsg = {
        bg = 'NONE',
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
    separator_style = "block",
    order = { "mode", "%=", "command", "recording_msg", "lsp_msg", "diagnostics", "git_branch_name" },
    modules = {
      command = function()
        return "%#St_custom_module# %S"
      end,
      recording_msg = function()
        local recording_register = vim.fn.reg_recording()

        if recording_register == "" then
          return ""
        end

        return "%#St_custom_module# Recording @" .. recording_register
      end,
      git_branch_name = function()
        local stbufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)

        local branch_name = vim.b[stbufnr].gitsigns_head

        if not branch_name then
          return ""
        end

        local git_icon = web_devicons.get_icon('git')

        return "%#St_git_branch# " .. git_icon .. "%#St_git_branch# " .. string.gsub(branch_name, "\n", "")
      end,
    },
  },
  tabufline = {
    order = { "treeOffset", "tabs", "buffers" },
  },
}

return M
