local function setupHighlights()
  local colors = {
    "#FE6D85",
    "#A485DD",
    "#98C379",
    "#38A89D",
    "#D7A65F",
    "#7199EE"
  }
  for i = 1, 6 do
    vim.api.nvim_set_hl(0, "MkdnHeading" .. i, {
      bg = colors[i],
      fg = "#1e1e2e",
      bold = true,
      default = true
    })
    vim.api.nvim_set_hl(0, "Heading" .. i .. "Corner", {
      fg = colors[i],
      default = true
    })
  end
  vim.api.nvim_set_hl(0, "MarkviewBlockQuoteDefault", {
    fg = colors[6]
  })
  vim.api.nvim_set_hl(0, "MkdnHoriz", {
    fg = colors[2]
  })
end

local function genHeading(headingNum)
  local padding = ""
  for i = (headingNum - 6), 1 do
    padding = padding .. "      "
  end
  return {
    style = "label",
    shift_char = "",

    padding_left = " ",
    padding_right = padding,

    corner_right = "",
    corner_right_hl = "Heading" .. headingNum .. "Corner",

    hl = "MkdnHeading" .. headingNum
  }
end


return {
  "OXY2DEV/markview.nvim",
  lazy = false,
  init = setupHighlights,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    require("markview").setup({
      modes = { "n", "i", "no", "c" },
      hybrid_modes = { "i" },

      checkboxes = {
        enable = true,
        checked = {
          text = " "
        },
        pending = {
          text = " "
        },
        unchecked = {
          text = " "
        },
      },
      headings = {
        enable = true,
        shift_width = 0,

        heading_1 = genHeading(1),
        heading_2 = genHeading(2),
        heading_3 = genHeading(3),
        heading_4 = genHeading(4),
        heading_5 = genHeading(5),
        heading_6 = genHeading(6)
      },
      code_blocks = {
        enable = true,
        style = "language",
        icons = true,
        min_width = 70,


        language_direction = "left",
        sign = true,
        sign_hl = nil,
      },
      block_quotes = {
        enable = true,

        default = {
          border = "▋",
        },
        callouts = nil
      },
      horizontal_rules = {
        enable = true,
        parts = {
          {
            type = "repeating",
            text = "─",
            repeat_amount = vim.api.nvim_win_get_width(0),
            hl = "MkdnHoriz"
          }
        }
      },
      links = { --handled by obsidian.nvim
        enable = false,
      },
      callbacks = {
        on_enable = function(_, win)
          vim.wo[win].conceallevel = 2;
          vim.wo[win].concealcursor = "nc";
        end
      }
    })
  end
}
