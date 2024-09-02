return {
  {
    'github/copilot.vim',
    event = { 'InsertEnter' },
    init = function()
      vim.g.copilot_no_tab_map = true
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
      { '<leader>ccc', '<cmd>CopilotChatToggle<CR>', desc = 'Toggle Copilot Chat', mode = { 'n', 'v' } },
      { '<leader>ccd', '<cmd>CopilotChatDocs<CR>', desc = 'Copilot Chat Docs', mode = { 'n', 'v' } },
      { '<leader>cct', '<cmd>CopilotChatTests<CR>', desc = 'Copilot Chat Tests', mode = { 'n', 'v' } },
      { '<leader>ccr', '<cmd>CopilotChatReset<CR>', desc = 'Copilot Chat Reset', mode = { 'n', 'v' } },
      { '<leader>cco', '<cmd>CopilotChatOptimize<CR>', desc = 'Copilot Chat Optimize', mode = { 'n', 'v' } },
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
