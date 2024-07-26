local git_tools = require("tools.git")
local files = require("tools.files")

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>")

-- Move
map("n", "<C-h>", "<C-w>h", { desc = "Switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "Switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "Switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Switch window up" })

map("n", "<leader>h", "^", { desc = "Move to beginning of line", remap = true })
map("n", "<leader>l", "$", { desc = "Move to end of line", remap = true })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "General clear highlights" })

-- Buffers
map("n", "<S-h>", function()
  require("nvchad.tabufline").prev()
end, { desc = "Next Buffer" })
map("n", "<S-l>", function()
  require("nvchad.tabufline").next()
end, { desc = "Previous Buffer" })
map("n", "<leader>x", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "Delete buffer" })

-- Undo / Redo in insert mode
map("i", "<C-z>", "<cmd>u<cr>", { desc = "Undo" })
map("i", "<C-r>", "<cmd>redo<cr>", { desc = "Redo" })

-- Code actions
map("v", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename" })
map("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format" })

-- Files
map("n", "<leader><space>", "<cmd>Telescope find_files<cr>", { desc = "Find File" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", { desc = "Open Recent File" })
map("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", { desc = "Find Word" })
map("n", "<leader>fg", files.live_grep_with_glob, { desc = "Find Glob" })

-- Git
map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "Git Commits" })
map("n", "<leader>gp", git_tools.git_commit_and_push, { desc = "Git commit and push" })
map("n", "<leader>gr", git_tools.pull_request_picker, { desc = "Pull Request Picker" })
map("n", "<leader>gs", git_tools.toggle_diffview, { desc = "Git Diff" })

-- Windows
map("n", "<leader>ww", "<C-W>p", { desc = "Other Window" })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window" })
map("n", "<leader>w=", "<C-W>v", { desc = "Split Window Right" })

-- nvim tree
map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle NvimTree" })

-- Diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end

map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

map("n", "<leader>df", function()
  vim.diagnostic.open_float()
end, { desc = "Open Diagnostic Float" })

-- Terminal
map({ "n", "t" }, "<C-/>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm", size = 0.6 }
end, { desc = "Terminal new horizontal term" })
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- Save
map("n", "<C-s>", "<cmd>write<cr>", { desc = "Save" })
-- Save in insert mode and quit insert mode
map("i", "<C-s>", "<cmd>write<cr><cmd>stopinsert<cr>", { desc = "Save" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "Toggle Comment", remap = true })
map("v", "<leader>/", "gc", { desc = "Toggle Comment", remap = true })

-- Registers
map("n", "<leader>rr", function()
  require('telescope.builtin').registers({ layout_config = { width = 0.5 } })
end, { desc = "Registers" })

-- New line in normal mode
map("n", "<A-o>", "o<Esc>", { desc = "New Line" })
map("n", "<A-O>", "O<Esc>", { desc = "New Line Above" })

map("n", "<leader>th", "<cmd>Telescope themes<CR>", { desc = "Themes" })
