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
map('n', '<leader>lz', '<cmd>Lazy<CR>', { desc = 'Open Lazy panel' })
