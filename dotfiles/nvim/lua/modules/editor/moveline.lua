return {
  {
    "willothy/moveline.nvim",
    build = "make",
    lazy = false,
    config = function()
      local keymap = function(mode, keys, action)
        vim.keymap.set(mode, keys, action, { silent = true })
      end
      keymap("v", "<C-k>", require("moveline").block_up)
      keymap("v", "<C-j>", require("moveline").block_down)
    end,
  },
}
