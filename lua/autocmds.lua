vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    -- Disable comment on newline
    vim.opt_local.formatoptions:remove({ 'r', 'o' })
  end,
})
