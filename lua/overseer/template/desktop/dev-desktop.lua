local overseer = require 'overseer'

return {
  name = 'Dev desktop app',
  builder = function()
    return {
      cmd = { 'pnpm' },
      args = { 'dev:desktop' },
      name = 'Dev desktop app',
      cwd = '~/workspaces/desktop',
    }
  end,
  tags = { overseer.TAG.RUN },
  condition = {
    dir = '~/workspaces/desktop',
  }
}
