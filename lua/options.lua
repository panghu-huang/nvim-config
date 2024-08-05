require "nvchad.options"

local o = vim.o

o.autoindent = true
o.cursorlineopt = 'both'
o.smartindent = true
o.linebreak = true
o.tabstop = 2
o.showcmdloc = 'statusline'
o.showcmd = true

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ 'r', 'o' })
  end,
})
