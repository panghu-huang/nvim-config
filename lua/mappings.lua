local EDITOR_NAME = "Panghu's Editor"

local function notify_info(msg)
  vim.notify(msg, vim.log.levels.INFO, { title = EDITOR_NAME })
end

local function notify_error(msg)
  vim.notify(msg, vim.log.levels.ERROR, { title = EDITOR_NAME })
end

local function git_commit_and_push()
  -- stderr is redirected to stdout
  local handle = io.popen("git rev-parse --abbrev-ref HEAD 2>&1")
  if handle == nil then
    notify_error("Not a git repository")
    return
  end

  local branch = handle:read("*a")

  if branch == nil or string.find(branch, "fatal") then
    notify_error("Not a git repository")
    return
  end

  local commit_msg = vim.fn.input("Commit message: ")
  -- User cancelled the input
  if commit_msg == "" then
    return
  end

  io.popen("git add . 1>/dev/null 2>&1")
  io.popen("git commit -m '" .. commit_msg .. "'" .. " 1>/dev/null 2>&1")
  io.popen("git push origin " .. branch .. " 1>/dev/null 2>&1")

  notify_info("Git commit and push successful")
end

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>")

-- Move
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

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
map("i", "<D-z>", "<cmd>u<cr>", { desc = "Undo" })
map("i", "<D-S-z>", "<cmd>redo<cr>", { desc = "Redo" })

-- Code actions
map("v", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename" })
map("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format" })

-- Files
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })
map("n", "<leader><space>", "<cmd>Telescope find_files<cr>", { desc = "Find File" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", { desc = "Open Recent File" })
map("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", { desc = "Find Word" })

-- Git
map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "Git Commits" })
map("n", "<leader>gs", "<cmd>Telescope git_status<CR>", { desc = "Git Status" })
map("n", "<leader>gp", git_commit_and_push, { desc = "Git commit and push" })

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

-- Terminal
map({ "n", "t" }, "<C-/>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "Terminal new horizontal term" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "Comment" })
map("v", "<leader>/", "gc", { desc = "Comment" })

-- Save
map("n", "<C-s>", "<cmd>write<cr>", { desc = "Save" })
-- Save in insert mode and quit insert mode
map("i", "<C-s>", "<cmd>write<cr><cmd>stopinsert<cr>", { desc = "Save" })
