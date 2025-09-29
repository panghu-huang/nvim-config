return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    keys = {
      {
        '<A-p>',
        '<cmd>Copilot panel<CR>',
        desc = 'Copilot panel',
        mode = { 'n', 'v', 'i' }
      },
    },
    opts = {
      copilot_node_command = vim.fn.expand("$HOME") .. '/.local/share/fnm/node-versions/v22.20.0/installation/bin/node',
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = '<A-j>',
          accept_word = '<A-w>',
          accept_line = '<A-l>',
          next = '<A-]>',
          prev = '<A-[>',
          dismiss = '<A-e>'
        },
      },
      filetypes = {
        markdown = true,
        yaml = true,
        ["."] = true,
      }
    },
  },
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'main',
    keys = {
      {
        '<leader>kc',
        '<cmd>CopilotChatToggle<CR>',
        desc = 'Toggle Copilot Chat',
        mode = { 'n', 'v' }
      },
      {
        '<leader>kd',
        '<cmd>CopilotChatDocs<CR>',
        desc = 'Copilot Chat Docs',
        mode = { 'n', 'v' }
      },
      {
        '<leader>kt',
        '<cmd>CopilotChatTests<CR>',
        desc = 'Copilot Chat Tests',
        mode = { 'n', 'v' },
      },
      {
        '<leader>kr',
        '<cmd>CopilotChatCodeReadability<CR>',
        desc = 'Copilot Chat Code Readability',
        mode = { 'n', 'v' }
      },
      {
        '<leader>ks',
        '<cmd>CopilotChatReset<CR>',
        desc = 'Copilot Chat Reset',
        mode = { 'n', 'v' }
      },
      {
        '<leader>ko',
        '<cmd>CopilotChatOptimize<CR>',
        desc = 'Copilot Chat Optimize',
        mode = { 'n', 'v' }
      },
    },
    opts = {
      question_header = '## Panghu',
      auto_insert_mode = true,
      window = {
        layout = 'float',
        width = 0.8,
        height = 0.8,
      },
      prompts = {
        CodeReadability = {
          prompt = 'Improve code readability, particularly by enhancing the naming of methods and variables.',
        },
      }
    },
  },
}
