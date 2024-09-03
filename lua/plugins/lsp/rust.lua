return {
  {
    'mrcjkb/rustaceanvim',
    version = '^5',
    ft = { 'rust' },
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
    },
    init = function()
      vim.g.rust_recommended_style = 0
    end,
    opts = function()
      local capabilities = require 'cmp_nvim_lsp'.default_capabilities()
      ---@class RustaceanvimConfig
      return {
        server = {
          capabilities = capabilities,
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
  },
  {
    'saecki/crates.nvim',
    tag = 'stable',
    event = 'BufRead Cargo.toml',
    config = function()
      local crates = require 'crates'

      crates.setup({
        enable_update_available_warning = false,
        completion = {
          cmp = {
            enabled = true,
          },
        },
        popup = {
          autofocus = true,
        },
        on_attach = function(bufnr)
          local map = function(mode, lhs, rhs, opts)
            local merged = vim.tbl_extend('force', {
              buffer = bufnr,
            }, opts)

            vim.keymap.set(mode, lhs, rhs, merged)
          end

          map("n", "<leader>vu", crates.update_crate, { desc = "Update crate version" })
          map("n", "<leader>vp", crates.show_features_popup, { desc = "Show features popup" })
        end
      })
    end,
  }
}
