require "nvchad.options"

local o = vim.o

o.autoindent = true
o.cursorlineopt = 'both'
o.smartindent = true
o.linebreak = true
o.tabstop = 2

-- Show command in statusline
o.showcmdloc = 'statusline'
o.showcmd = true

-- For copilot.nvim
vim.g.copilot_no_tab_map = true
