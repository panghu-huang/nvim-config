local M = {}

local function live_grep_with_glob()
  local glob = vim.fn.input "Glob: "
  local glob_table = vim.split(glob, ",")

  require("telescope.builtin").live_grep {
    prompt_title = "Live Grep with Glob",
    glob_pattern = glob_table,
  }
end

M.live_grep_with_glob = live_grep_with_glob

return M
