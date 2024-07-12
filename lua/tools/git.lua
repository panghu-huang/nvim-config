local EDITOR_NAME = "Panghu's Editor"

local function notify_info(msg)
  vim.notify(msg, vim.log.levels.INFO, { title = EDITOR_NAME })
end

local function notify_error(msg)
  vim.notify(msg, vim.log.levels.ERROR, { title = EDITOR_NAME })
end

local function git_commit_and_push()
  local branch_name = vim.fn.system("git rev-parse --abbrev-ref HEAD")
  if string.find(branch_name, "not a git repository") then
    notify_error("Not a git repository")
    return
  end

  local commit_msg = vim.fn.input("Commit message: ")
  -- User cancelled the input
  if commit_msg == "" then
    return
  end

  vim.fn.system("git add .")
  vim.fn.system("git commit -m '" .. commit_msg .. "'")
  vim.fn.system("git push origin " .. branch_name)

  notify_info("Git commit and push successful")
end

local M = {}

M.git_commit_and_push = git_commit_and_push

return M
