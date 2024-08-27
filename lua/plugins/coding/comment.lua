return {
  "numToStr/Comment.nvim",
  event = "VeryLazy",
  config = function(_, opts)
    require('Comment').setup(opts)
  end
}
