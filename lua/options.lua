local o = vim.o
local g = vim.g
local opt = vim.opt

o.laststatus = 3
o.showmode = false

o.cursorlineopt = 'both'
o.cursorline = true

o.autoindent = true
o.linebreak = true
o.expandtab = true
o.smartindent = true
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2

o.ignorecase = true
o.smartcase = true

o.clipboard = 'unnamedplus'

-- Numbers
o.number = true
o.relativenumber = true
o.numberwidth = 2
o.ruler = false

o.undofile = true

-- disable nvim intro
opt.shortmess:append 'WF'
opt.termguicolors = true

g.rust_recommended_style = 0

-- Add binaries installed by mason.nvim to path
local is_windows = vim.fn.has 'win32' ~= 0
local sep = is_windows and '\\' or '/'
local delim = is_windows and ';' or ':'

vim.env.PATH = table.concat({ vim.fn.stdpath 'data', 'mason', 'bin' }, sep) .. delim .. vim.env.PATH
