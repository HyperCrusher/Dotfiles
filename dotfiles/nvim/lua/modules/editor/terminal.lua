return {
  {
    "aserowy/tmux.nvim",
    opts = {
      copy_sync = {
        enable = false,
      },
    }
  },
  {
    "willothy/flatten.nvim",
    opts = {
      one_per = {
        kitty = true
      }
    },
    lazy = false,
    priority = 1001
  }
}
