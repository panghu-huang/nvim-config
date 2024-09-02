local is_diffview_open = false

local function toggle_diffview()
  if is_diffview_open then
    vim.cmd 'DiffviewClose'
  else
    vim.cmd 'DiffviewOpen'
  end

  is_diffview_open = not is_diffview_open
end

return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewClose" },
  keys = {
    {
      "<leader>gs",
      toggle_diffview,
      desc = "Toggle diff view",
      mode = { "n", "v" }
    }
  }
}
