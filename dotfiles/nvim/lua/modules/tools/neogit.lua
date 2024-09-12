return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      integrations = {
        telescope = true,
        diffview = true
      }
    }
  },
  {
    "sindrets/diffview.nvim",
    init = function()
      vim.opt.fillchars:append { diff = "╱" }
    end,
    opts = {
      enhanced_diff_hl = true,
    }
  }
}
