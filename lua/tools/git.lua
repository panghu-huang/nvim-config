local function notify_info(msg)
  vim.notify(msg, vim.log.levels.INFO)
end

local function notify_error(msg)
  vim.notify(msg, vim.log.levels.ERROR)
end

local function run_command(cmd)
  local output = vim.fn.system(cmd)

  return output, vim.v.shell_error
end

local function git_commit_and_push()
  local branch_name, code = run_command 'git rev-parse --abbrev-ref HEAD'

  if code ~= 0 then
    notify_error 'Failed to get current branch name'
    return
  end

  local commit_msg = vim.fn.input 'Commit message: '
  -- User cancelled the input
  if commit_msg == '' then
    return
  end

  run_command 'git add .'
  local _, commit_exit_code = run_command("git commit -m '" .. commit_msg .. "'")

  if commit_exit_code ~= 0 then
    notify_error 'Failed to commit changes'
    return
  end

  local _, push_exit_code = run_command('git push origin ' .. branch_name)

  if push_exit_code ~= 0 then
    notify_error 'Failed to push changes'
    return
  end

  notify_info 'Git commit and push successful'
end

local is_diffview_open = false

local function toggle_diffview()
  if is_diffview_open then
    vim.cmd 'DiffviewClose'
  else
    vim.cmd 'DiffviewOpen'
  end

  is_diffview_open = not is_diffview_open
end

local function pull_request_picker()
  local pickers = require 'telescope.pickers'
  local finders = require 'telescope.finders'

  pickers
    .new({}, {
      prompt_title = 'Pull Request Picker',
      finder = finders.new_table {
        results = {
          { '1', 'Add feature A' },
          { '2', 'Fix bug B' },
          { '3', 'Refactor C' },
        },
        entry_maker = function(entry)
          return {
            value = entry,
            display = entry[2],
            ordinal = entry[1],
          }
        end,
      },
      attach_mappings = function(prompt_bufnr)
        local actions = require 'telescope.actions'
        local action_state = require 'telescope.actions.state'

        actions.select_default:replace(function()
          local selection = action_state.get_selected_entry()

          print(vim.inspect(selection))

          actions.close(prompt_bufnr)
        end)

        return true
      end,
    })
    :find()
end

local M = {}

M.git_commit_and_push = git_commit_and_push
M.pull_request_picker = pull_request_picker
M.toggle_diffview = toggle_diffview

return M
