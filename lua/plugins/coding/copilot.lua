return {
  {
    'github/copilot.vim',
    event = 'VeryLazy',
    keys = {
      {
        '<A-j>',
        'copilot#Accept("\\<CR>")',
        desc = 'Copilot Accept',
        expr = true,
        replace_keycodes = false,
        silent = true,
        mode = { 'i' },
      },
      {
        '<A-w>',
        'copilot#AcceptWord()',
        desc = 'Copilot Accept Word',
        expr = true,
        replace_keycodes = false,
        silent = true,
        mode = { 'i' },
      },
      {
        '<A-l>',
        'copilot#AcceptLine()',
        desc = 'Copilot Accept Line',
        expr = true,
        replace_keycodes = false,
        silent = true,
        mode = { 'i' },
      },
      {
        '<A-]>',
        'copilot#Next()',
        desc = 'Copilot Next Suggestion',
        expr = true,
        replace_keycodes = false,
        silent = true,
        mode = { 'i' },
      },
      {
        '<A-[>',
        'copilot#Previous()',
        desc = 'Copilot Previous Suggestion',
        expr = true,
        replace_keycodes = false,
        silent = true,
        mode = { 'i' },
      },
      {
        '<A-space>',
        'copilot#Suggest()',
        desc = 'Copilot Suggest',
        expr = true,
        replace_keycodes = false,
        silent = true,
        mode = { 'i' },
      },
      {
        '<A-e>',
        'copilot#Dismiss()',
        desc = 'Copilot Dismiss',
        expr = true,
        replace_keycodes = false,
        silent = true,
        mode = { 'i' },
      },
    },
    init = function()
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_no_maps = true
      vim.g.copilot_enabled = true

      local node20 = os.getenv('NODE20_HOME')

      if node20 ~= nil then
        vim.g.copilot_node_command = node20
      end
    end,
  },
  -- {
  --   'zbirenbaum/copilot.lua',
  --   cmd = 'Copilot',
  --   event = 'InsertEnter',
  --   opts = {
  --     suggestion = {
  --       enabled = true,
  --       auto_trigger = true,
  --       keymap = {
  --         accept = '<C-j>',
  --         next = '<C-]>',
  --         prev = '<C-[>',
  --       },
  --     }
  --   },
  -- },
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'canary',
    dependencies = {
      'github/copilot.vim',
      'nvim-lua/plenary.nvim',
    },
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
