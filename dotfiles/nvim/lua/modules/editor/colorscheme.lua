return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    init = function()
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
    opts = {
      color_overrides = {
        all = {
          rosewater = "#F6955B", -- orange
          flamingo = "#FE6D85",  -- bgred
          pink = "#FF9CAE",      -- lighter version of red
          mauve = "#A485DD",     -- purple
          red = "#EE6D85",
          maroon = "#D35D75",    -- darker version of red
          peach = "#FFAB7B",     -- lighter version of orange
          yellow = "#e0af68",
          green = "#95C561",
          teal = "#38A89D",     -- cyan
          sky = "#89B9FF",      -- lighter version of blue
          sapphire = "#5A89DE", -- darker version of blue
          blue = "#7199EE",
          lavender = "#B0B8DD", -- lighter version of fg
          text = "#A0A8CD",     -- fg
          subtext1 = "#8690B5", -- between fg and fgalt
          subtext0 = "#51597D", -- fgalt
          overlay2 = "#5A6067", -- lighter grey
          overlay1 = "#4A5057", -- original grey
          overlay0 = "#3F444B", -- darker grey
          surface2 = "#353945", -- bg3
          surface1 = "#282c34", -- bg5
          surface0 = "#1E2129", -- new color
          base = "#16161e",     -- bg0
          mantle = "#101014",   -- border
          crust = "#06090A",    -- black
        }
      },
      custom_highlights = function(colors)
        return {
          Cursor = { reverse = true }
        }
      end,
      transparent_background = false,
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
  },
}
