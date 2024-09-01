return {
  'mrcjkb/rustaceanvim',
  version = '^4',
  ft = { 'rust' },
  init = function()
    vim.g.rust_recommended_style = 0
  end,
  opts = function()
    ---@class RustaceanvimConfig
    return {
      server = {
        default_settings = {
          -- rust-analyzer language server configuration
          ['rust-analyzer'] = {
            cargo = {
              allFeatures = true,
              loadOutDirsFromCheck = true,
              buildScripts = {
                enable = true,
              },
            },
            -- Add clippy lints for Rust.
            checkOnSave = true,
            procMacro = {
              enable = true,
              ignored = {
                ['async-trait'] = { 'async_trait' },
                ['napi-derive'] = { 'napi' },
                ['async-recursion'] = { 'async_recursion' },
              },
            },
          },
        },
      },
    }
  end,
  config = function(_, opts)
    vim.g.rustaceanvim = vim.tbl_deep_extend('force', vim.g.rustaceanvim or {}, opts or {})

    if vim.fn.executable 'rust-analyzer' == 0 then
      vim.notify('rust-analyzer not found. Please install it', vim.log.levels.ERROR, { title = 'LSP: Rust' })
    end
  end,
}
