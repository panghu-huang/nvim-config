local autocmd = vim.api.nvim_create_autocmd

autocmd('LspAttach', {
  callback = function(args)
    local map = function(mode, lhs, rhs, opts)
      local merged = vim.tbl_extend('force', {
        buffer = args.buf,
      }, opts)

      vim.keymap.set(mode, lhs, rhs, merged)
    end

    map('n', 'K', '<cmd>Lspsaga hover_doc<CR>', { desc = 'Hover Doc' })
    map('n', '<leader>co', '<cmd>Lspsaga outline<CR>', { desc = 'Code Outline' })
    map({ 'n', 'v' }, '<leader>ca', '<cmd>Lspsaga code_action<CR>', { desc = 'Code Actions' })
    map({ 'n', 'v' }, '<leader>cr', vim.lsp.buf.rename, { desc = 'Rename' })
    -- map({ 'n', 'v' }, '<leader>cr', '<cmd>Lspsaga rename<CR>', { desc = 'Rename' })
    map('n', 'gr', '<cmd>Lspsaga finder<CR>', { desc = 'Refernece', noremap = true })
    map('n', 'gd', '<cmd>Lspsaga goto_definition<CR>', { desc = 'Goto Definition', noremap = true })
    map('n', '<leader>dw', '<cmd>Lspsaga show_workspace_diagnostics ++float<CR>', { desc = 'Workspace Diagnostics' })
  end,
})

autocmd('VimEnter', {
  callback = function()
    local x = vim.diagnostic.severity

    vim.diagnostic.config {
      virtual_text = { prefix = "" },
      signs = { text = { [x.ERROR] = "󰅙", [x.WARN] = "", [x.INFO] = "󰋼", [x.HINT] = "󰌵" } },
      underline = true,
      float = { border = "single" },
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
