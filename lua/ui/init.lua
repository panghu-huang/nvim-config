local dashboard = require 'ui.dashboard'

local function draw_dashboard()
  dashboard.draw()
end

local function setup(opts)
  require('ui.theme').setup()

  dashboard.setup {
    header = opts.header,
    buttons = opts.buttons,
  }
end

local M = {}

M.draw_dashboard = draw_dashboard
M.setup = setup

return M
