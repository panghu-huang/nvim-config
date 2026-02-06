local M = {}

local function get_dev_scripts()
  local scripts_dir = vim.fn.getenv("DEV_TOOLS_SCRIPTS_PATH")
  if not scripts_dir or scripts_dir == vim.NIL then
    vim.notify("DEV_TOOLS_SCRIPTS_PATH environment variable is not set", vim.log.levels.ERROR)
    return {}
  end
  local scripts = {}

  -- Check if directory exists
  if vim.fn.isdirectory(scripts_dir) == 0 then
    vim.notify("Dev scripts directory not found: " .. scripts_dir, vim.log.levels.WARN)
    return scripts
  end

  -- Get all .sh files
  local files = vim.fn.globpath(scripts_dir, "*.sh", false, true)

  for _, file in ipairs(files) do
    local name = vim.fn.fnamemodify(file, ":t:r") -- Get filename without extension
    table.insert(scripts, {
      name = name,
      path = file,
    })
  end

  return scripts
end

local function execute_script(item)
  vim.cmd("terminal bash " .. vim.fn.shellescape(item.path))
end

local function show_dev_tools()
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local conf = require("telescope.config").values
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")

  local scripts = get_dev_scripts()

  if #scripts == 0 then
    vim.notify("No dev tools found", vim.log.levels.INFO)
    return
  end

  pickers.new({}, {
    prompt_title = "Development Tools",
    finder = finders.new_table({
      results = scripts,
      entry_maker = function(entry)
        local display = "📄 " .. entry.name

        return {
          value = entry,
          display = display,
          ordinal = entry.name,
        }
      end,
    }),
    sorter = conf.generic_sorter({}),
    attach_mappings = function(prompt_bufnr)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        if selection then
          execute_script(selection.value)
        end
      end)
      return true
    end,
  }):find()
end

M.show_dev_tools = show_dev_tools

return M
