local M = {}

local function live_grep_with_glob()
  local glob = vim.fn.input "Glob: "
  local glob_table = vim.split(glob, ",")

  require("telescope.builtin").live_grep {
    prompt_title = "Live Grep with Glob",
    glob_pattern = glob_table,
  }
end

local function find_app_directory()
  local cwd = vim.fn.getcwd()
  local current_path = vim.fn.expand('%:p:h') or cwd

  -- Project configuration files to look for
  local config_files = {
    'package.json',
    'Cargo.toml',
    'go.mod',
  }

  -- Start from current file directory and traverse up
  local path = current_path
  while path and path ~= '/' and path ~= cwd do
    -- Check if any config file exists in current directory
    for _, config_file in ipairs(config_files) do
      if vim.fn.filereadable(path .. '/' .. config_file) == 1 then
        return path
      end
    end
    -- Move up one directory
    path = vim.fn.fnamemodify(path, ':h')
  end

  -- If not in an app directory, fallback to root directory
  return cwd
end

local function find_files_in_app()
  local app_dir = find_app_directory()
  require('fzf-lua').files({ cwd = app_dir })
end

local function find_files_in_current_dir()
  local current_dir = vim.fn.expand('%:p:h')
  require('fzf-lua').files({ cwd = current_dir })
end

M.live_grep_with_glob = live_grep_with_glob
M.find_files_in_app = find_files_in_app
M.find_files_in_current_dir = find_files_in_current_dir

return M
