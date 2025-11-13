local autocmd = vim.api.nvim_create_autocmd

autocmd('VimEnter', {
  callback = function()
    local x = vim.diagnostic.severity

    vim.diagnostic.config {
      virtual_text = { prefix = "" },
      signs = { text = { [x.ERROR] = "󰅙", [x.WARN] = "", [x.INFO] = "󰋼", [x.HINT] = "󰌵" } },
      underline = true,
      float = {
        border = "single"
      },
    }
  end,
})

autocmd('FileType', {
  pattern = '*',
  callback = function()
    -- Disable comment on newline
    vim.opt_local.formatoptions:remove { 'r', 'o' }
  end,
})
