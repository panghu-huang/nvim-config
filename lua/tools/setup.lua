local function setup(opts)
  require('tools.lazy-nvim').setup {
    plugins = opts.plugins or {},
  }
end

return setup
