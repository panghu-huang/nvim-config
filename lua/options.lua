local o, opt = vim.o, vim.opt

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

o.signcolumn = 'yes'

o.undofile = true

-- Spell check
o.spell = true
o.spelllang = 'en'
o.spelloptions = 'camel'

-- Show command in statusline
o.showcmdloc = 'statusline'
o.showcmd = true
o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

opt.termguicolors = true

vim.filetype.add({
  extension = {
    ['http'] = 'http'
  }
})

-- Add binaries installed by mason.nvim to path
local is_windows = vim.fn.has 'win32' ~= 0
local sep = is_windows and '\\' or '/'
local delim = is_windows and ';' or ':'


vim.env.PATH = table.concat({ vim.fn.stdpath 'data', 'mason', 'bin' }, sep) .. delim .. vim.env.PATH
