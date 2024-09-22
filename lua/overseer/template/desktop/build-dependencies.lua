local overseer = require 'overseer'

return {
  name = 'Build desktop dependencies',
  builder = function()
    return {
      cmd = { 'pnpm' },
      args = { 'build:libs' },
      name = 'Build desktop dependencies',
      cwd = '~/workspaces/desktop',
    }
  end,
  tags = { overseer.TAG.BUILD },
  condition = {
    dir = '~/workspaces/desktop',
  }
}
