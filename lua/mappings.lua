local git_tools = require 'tools.git'
local file_tools = require 'tools.files'
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
map('n', '<A-o>', 'o<Esc>', { desc = 'New Line', silent = true })
map('n', '<A-O>', 'O<Esc>', { desc = 'New Line Above', silent = true })
-- New line in insert mode
map('i', '<A-o>', '<Esc>o', { desc = 'New Line', silent = true })
map('i', '<A-O>', '<Esc>O', { desc = 'New Line Above', silent = true })

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

-- Buffer
map('n', '<S-h>', '<cmd>BufferLineCyclePrev<CR>', { desc = 'Previous buffer' })
map('n', '<S-l>', '<cmd>BufferLineCycleNext<CR>', { desc = 'Next buffer' })
map('n', '<leader>bo', '<cmd>BufferLineCloseOthers<CR>', { desc = 'Close all other visible buffers' })
map('n', '<leader>x', function()
  local buffer_tools = require 'tools.buffers'
  local buf = vim.api.nvim_get_current_buf()

  buffer_tools.del_buf(buf)
end, { desc = 'Delete current buffer' })

-- Tab
map('n', '<C-Left>', '<cmd>tabp<CR>', { desc = 'Previous tab' })
map('n', '<C-Right>', '<cmd>tabn<CR>', { desc = 'Next tab' })

-- Files
map('n', '<leader><space>', '<cmd>Telescope find_files<cr>', { desc = 'Find File' })
map('n', '<leader>fo', '<cmd>Telescope oldfiles<cr>', { desc = 'Open Recent File' })
map('n', '<leader>fw', '<cmd>Telescope live_grep<cr>', { desc = 'Find Word' })
map("n", "<leader>fg", file_tools.live_grep_with_glob, { desc = "Find Glob" })

-- Git
map('n', '<leader>gc', '<cmd>Telescope git_commits<CR>', { desc = 'Git Commits' })
map('n', '<leader>gp', git_tools.git_commit_and_push, { desc = 'Git commit and push' })
map('n', '<leader>gr', git_tools.pull_request_picker, { desc = 'Pull Request Picker' })

-- Diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go { severity = severity }
  end
end

map('n', ']d', diagnostic_goto(true), { desc = 'Next Diagnostic' })
map('n', '[d', diagnostic_goto(false), { desc = 'Prev Diagnostic' })
map('n', ']e', diagnostic_goto(true, 'ERROR'), { desc = 'Next Error' })
map('n', '[e', diagnostic_goto(false, 'ERROR'), { desc = 'Prev Error' })
map('n', ']w', diagnostic_goto(true, 'WARN'), { desc = 'Next Warning' })
map('n', '[w', diagnostic_goto(false, 'WARN'), { desc = 'Prev Warning' })
map('n', '<leader>df', vim.diagnostic.open_float, { desc = 'Open Diagnostic Float' })

-- Registers
map('n', '<leader>rr', function()
  require('telescope.builtin').registers { layout_config = { width = 0.5 } }
end, { desc = 'Registers' })

-- map('i', '<C-j>', 'copilot#Accept("\\<CR>")', {
--   expr = true,
--   replace_keycodes = false,
--   silent = true,
-- })

-- Code actions
map('n', '<leader>cf', vim.lsp.buf.format, { desc = 'Format' })

-- Theme
map('n', '<leader>mt', function()
  local telescope = require 'telescope.builtin'
  telescope.colorscheme { enable_preview = true }
end, { desc = 'Toggle Theme' })
