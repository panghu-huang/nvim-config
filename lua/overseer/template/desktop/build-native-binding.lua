local overseer = require 'overseer'

return {
  name = 'Build native binding',
  builder = function()
    return {
      cmd = { 'pnpm' },
      args = { 'build', '--filter', '@desktop/core', 'build' },
      name = 'Build native binding',
      cwd = '~/workspaces/desktop',
    }
  end,
  tags = { overseer.TAG.BUILD },
  condition = {
    dir = '~/workspaces/desktop',
  }
}
