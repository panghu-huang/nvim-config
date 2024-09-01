local cmp_highlight = require 'theme.cmp'

local default_highlights = {
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
