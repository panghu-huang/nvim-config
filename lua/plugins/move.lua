return {
  "echasnovski/mini.move",
  event = "BufEnter",
  config = function()
    require("mini.move").setup()
  end,
}
