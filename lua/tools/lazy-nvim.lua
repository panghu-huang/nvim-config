local function clone_lazy_nvim_if_not_exists()
  local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
  if not vim.uv.fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'

    local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }

    if vim.v.shell_error ~= 0 then
      vim.api.nvim_echo({
        { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
        { out,                            'WarningMsg' },
        { '\nPress any key to exit...' },
      }, true, {})

      vim.fn.getchar()

      os.exit(1)
    end
  end

  vim.opt.rtp:prepend(lazypath)
end

local function setup(opts)
  clone_lazy_nvim_if_not_exists()

  local config = {
    spec = opts.plugins,
    defaults = {
      lazy = true,
    },
    change_detection = {
      enabled = false,
    },
    performance = {
      rtp = {
        disabled_plugins = {
          '2html_plugin',
          'tohtml',
          'getscript',
          'getscriptPlugin',
          'gzip',
          'logipat',
          'netrw',
          'netrwPlugin',
          'netrwSettings',
          'netrwFileHandlers',
          'matchit',
          'tar',
          'tarPlugin',
          'rrhelper',
          'spellfile_plugin',
          'vimball',
          'vimballPlugin',
          'zip',
          'zipPlugin',
          'tutor',
          'rplugin',
          'syntax',
          'synmenu',
          'optwin',
          'compiler',
          'bugreport',
          'ftplugin',
          'osc52',
        },
      },
    },
  }

  require('lazy').setup(config)
end

local M = {}

M.setup = setup

return M
