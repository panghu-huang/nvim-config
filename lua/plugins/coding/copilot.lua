return {
  {
    'github/copilot.vim',
    event = 'InsertEnter',
    init = function()
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_enabled = true

      local node20 = os.getenv('NODE20_HOME')

      if node20 ~= nil then
        vim.g.copilot_node_command = node20
      end
    end,
  },
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'canary',
    dependencies = {
      'github/copilot.vim',
      'nvim-lua/plenary.nvim',
    },
    keys = {
      { '<leader>kc', '<cmd>CopilotChatToggle<CR>',   desc = 'Toggle Copilot Chat',   mode = { 'n', 'v' } },
      { '<leader>kd', '<cmd>CopilotChatDocs<CR>',     desc = 'Copilot Chat Docs',     mode = { 'n', 'v' } },
      { '<leader>kt', '<cmd>CopilotChatTests<CR>',    desc = 'Copilot Chat Tests',    mode = { 'n', 'v' } },
      { '<leader>kr', '<cmd>CopilotChatReset<CR>',    desc = 'Copilot Chat Reset',    mode = { 'n', 'v' } },
      { '<leader>ko', '<cmd>CopilotChatOptimize<CR>', desc = 'Copilot Chat Optimize', mode = { 'n', 'v' } },
    },
    opts = {
      question_header = '## Panghu',
      auto_insert_mode = true,
      window = {
        layout = 'float',
        width = 0.8,
        height = 0.8,
      },
    },
  },
}
