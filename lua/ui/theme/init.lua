local cmp_highlight = require 'ui.theme.cmp'

local default_highlights = {
  DashboardAscii = {
    fg = 'white',
    bg = '#086079',
  },
  DashboardButtons = {
    fg = 'white',
    bg = '#353a3f',
  },
  Popup = {
    bg = '#17182c',
    fg = '#a6a6b5',
  },
  SelectedLine = {
    bg = '#31344e',
    fg = 'white',
  },
}

local M = {}

local function setup()
  local all_highlights = vim.tbl_deep_extend('force', default_highlights, cmp_highlight)

  for name, hl in pairs(all_highlights) do
    vim.api.nvim_set_hl(0, name, hl)
  end
end

M.setup = setup

return M
