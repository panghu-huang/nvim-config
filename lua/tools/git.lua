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

local function pull_request_picker()
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")

  pickers.new({}, {
    prompt_title = "Pull Request Picker",
    finder = finders.new_table({
      results = {
        { "1", "Add feature A" },
        { "2", "Fix bug B" },
        { "3", "Refactor C" },
      },
      entry_maker = function(entry)
        return {
          value = entry,
          display = entry[2],
          ordinal = entry[1],
        }
      end,
    }),
    attach_mappings = function(prompt_bufnr)
      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")

      actions.select_default:replace(function()
        local selection = action_state.get_selected_entry()

        print(selection[1])

        actions.close(prompt_bufnr)
      end)

      return true
    end,
  }):find()
end

local M = {}

M.git_commit_and_push = git_commit_and_push
M.pull_request_picker = pull_request_picker

return M
