local git_tools = require 'tools.git'
local map = vim.keymap.set

map('n', '<C-z>', '<nop>', { desc = 'Disable suspend' })
map('n', ';', ':', { desc = 'CMD enter command mode' })
map('i', 'jj', '<ESC>')

-- Move
map('n', '<C-h>', '<C-w>h', { desc = 'Switch window left' })
map('n', '<C-l>', '<C-w>l', { desc = 'Switch window right' })
map('n', '<C-j>', '<C-w>j', { desc = 'Switch window down' })
map('n', '<C-k>', '<C-w>k', { desc = 'Switch window up' })

map('n', '<leader>h', '^', { desc = 'Move to beginning of line', remap = true })
map('n', '<leader>l', '$', { desc = 'Move to end of line', remap = true })

map('n', '<Esc>', '<cmd>noh<CR>', { desc = 'General clear highlights' })

-- Undo / Redo in insert mode
map('i', '<C-z>', '<cmd>u<cr>', { desc = 'Undo' })
map('i', '<C-r>', '<cmd>redo<cr>', { desc = 'Redo' })

-- Windows
map('n', '<leader>ww', '<C-W>p', { desc = 'Other Window' })
map('n', '<leader>wd', '<C-W>c', { desc = 'Delete Window' })
map('n', '<leader>w=', '<C-W>v', { desc = 'Split Window Right' })

-- Save
map('n', '<C-s>', '<cmd>write<cr>', { desc = 'Save' })
-- Save and quit insert mode or visual mode
map({ 'i', 'v' }, '<C-s>', '<cmd>write<cr><cmd>stopinsert<cr>', { desc = 'Save' })

-- New line in normal mode
map('n', '<A-o>', 'o<Esc>', { desc = 'New Line' })
map('n', '<A-O>', 'O<Esc>', { desc = 'New Line Above' })

-- Coding
map('i', 'kk', '<ESC>[mi', { desc = 'Move to previous import block' })
map('i', '<C-h>', '<ESC>I', { desc = 'Insert at the beginning of the line' })
map('i', '<C-l>', '<ESC>A', { desc = 'Insert at the end of the line' })
map('i', '<C-w>', '<ESC>lwi', { desc = 'Insert at next word start' })
map('i', '<C-b>', '<ESC>bi', { desc = 'Insert at previous word start' })

-- Comment
map('n', '<leader>/', 'gcc', { desc = 'Toggle Comment', remap = true })
map('v', '<leader>/', 'gc', { desc = 'Toggle Comment', remap = true })

-- Lazy
map('n', '<leader>zz', '<cmd>Lazy<CR>', { desc = 'Open Lazy panel' })

-- Bufferline
map('n', '<S-h>', '<cmd>BufferLineCyclePrev<CR>', { desc = 'Previous buffer' })
map('n', '<S-l>', '<cmd>BufferLineCycleNext<CR>', { desc = 'Next buffer' })
map('n', '<leader>x', function()
  local buffer_tools = require 'tools.buffers'
  local buf = vim.api.nvim_get_current_buf()

  buffer_tools.del_buf(buf)
end, { desc = 'Delete current buffer' })

-- Files
map('n', '<leader><space>', '<cmd>Telescope find_files<cr>', { desc = 'Find File' })
map('n', '<leader>fo', '<cmd>Telescope oldfiles<cr>', { desc = 'Open Recent File' })
map('n', '<leader>fw', '<cmd>Telescope live_grep<cr>', { desc = 'Find Word' })

-- Git
map('n', '<leader>gc', '<cmd>Telescope git_commits<CR>', { desc = 'Git Commits' })
map('n', '<leader>gp', git_tools.git_commit_and_push, { desc = 'Git commit and push' })
map('n', '<leader>gr', git_tools.pull_request_picker, { desc = 'Pull Request Picker' })
map('n', '<leader>gs', git_tools.toggle_diffview, { desc = 'Git Diff' })
