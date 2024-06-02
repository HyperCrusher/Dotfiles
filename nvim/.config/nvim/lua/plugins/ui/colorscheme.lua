return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      transparent_background = true,
      flavour = "mocha",
      integrations = {
        treesitter = true,
        harpoon = true,
        headlines = true,
        indent_blankline = {
          enabled = true,
          scope_color = "mauve",
        },
        mason = true,
        lsp_trouble = true,
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
