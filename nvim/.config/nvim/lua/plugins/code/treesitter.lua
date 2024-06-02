return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    init = function(plugin)
      require("lazy.core.loader").add_to_rtp(plugin)
      require("nvim-treesitter.query_predicates")
    end,
    dependencies = {
      { "nvim-treesitter/nvim-treesitter-textobjects" },
      {
        "JoosepAlviste/nvim-ts-context-commentstring",
        config = function()
          vim.g.skip_ts_context_commentstring_module = true
          require("ts_context_commentstring").setup()
          vim.keymap.set("n", "[u", function()
            require("treesitter-context").go_to_context(vim.v.count1)
            vim.cmd("normal! $zz")
          end, { silent = true })
        end,
      },
      {
        "altermo/ultimate-autopair.nvim",
        event = {
          "InsertEnter",
          "CmdlineEnter",
        },
        branch = "v0.6",
        config = true,
      },
      { "windwp/nvim-ts-autotag" },
      { "RRethy/nvim-treesitter-endwise" },
      { "m-demare/hlargs.nvim" },
    },
    highlight = { enable = true },
    opts = {
      indent = { enable = true },
      ensure_installed = {},
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["as"] = "@scope",
          },
          selection_modes = {
            ["@parameter.outer"] = "v",
            ["@function.outer"] = "V",
            ["@class.outer"] = "V",
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["<Leader>sn"] = "@parameter.inner",
          },
          swap_previous = {
            ["<Leader>sp"] = "@parameter.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]f"] = "@function.outer",
            ["]c"] = "@class.outer",
            ["]s"] = "@scope",
            ["]z"] = "@fold",
          },
          goto_previous_start = {
            ["[f"] = "@function.outer",
            ["[c"] = "@class.outer",
            ["[s"] = "@scope",
            ["[z"] = "@fold",
          },
          goto_next = {
            ["]]"] = "@conditional.outer",
          },
          goto_previous = {
            ["[["] = "@conditional.outer",
          },
        },
      },
      endwise = {
        enable = true,
      },
      autotag = {
        enable = true,
      },
    },
    config = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        local added = {}
        opts.ensure_installed = vim.tbl_filter(function(lang)
          if added[lang] then
            return false
          end
          added[lang] = true
          return true
        end, opts.ensure_installed)
      end
      require("nvim-treesitter.configs").setup(opts)
      -- Fix conceal level and types with md to make notes usable
      vim.treesitter.query.set(
        "markdown",
        "highlights",
        [[
                ([
                    (fenced_code_block_delimiter)
                ])
                ]]
      )
    end,
  },
}
