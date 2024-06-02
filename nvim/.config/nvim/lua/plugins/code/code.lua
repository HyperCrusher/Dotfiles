return {
  -- My preferred way to use git
  { "kdheepak/lazygit.nvim" },
  -- Toggle end chars
  {
    "saifulapm/chartoggle.nvim",
    opts = {
      leader = "<leader>",
      keys = { ",", ";" },
    },
  },
  -- Easily change surrounding chars
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {
      keymaps = {
        normal = "S",
        normal_cur = "Ss",
        visual = "S",
        delete = "ds",
        change = "cs",
      },
    },
  },
  -- Comments
  {
    "numToStr/Comment.nvim",
    opts = {
      toggler = {
        line = "gcc",
        block = "gbc",
      },
      opleader = {
        line = "gc",
        block = "gbc",
      },
      extra = {
        above = "gcO",
        below = "gco",
        eol = "gca",
      },
    },
    lazy = false,
  },
  -- Null-ls defunct time to do it right.
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {},
    },
    config = function(_, opts)
      require("lint").linters_by_ft = {}
      if type(opts.linters) == "table" then
        local added = {}
        opts.linters = vim.tbl_filter(function(linter)
          if type(linter) == "table" and linter.lang and linter.linter then
            local id = linter.lang .. "-" .. linter.linter
            if added[id] then
              return false
            end
            added[id] = true
            return true
          end
          return false
        end, opts.linters)
      end
      for _, v in pairs(opts.linters) do
        require("lint").linters_by_ft[v.lang] = require("lint").linters_by_ft[v.lang] or {}
        vim.list_extend(require("lint").linters_by_ft[v.lang], { v.linter })
      end
      vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
        callback = function()
          require("lint").try_lint()
          require("lint").try_lint("codespell")
          require("lint").try_lint("typos")
        end,
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {},
    },
    config = function(_, opts)
      if type(opts.formatters) == "table" then
        local added = {}
        opts.formatters = vim.tbl_filter(function(formatter)
          if type(formatter) == "table" and formatter.lang and formatter.formatter then
            local id = formatter.lang .. "-" .. formatter.formatter
            if added[id] then
              return false
            end
            added[id] = true
            return true
          end
          return false
        end, opts.formatters)
      end
      for _, v in pairs(opts.formatters) do
        require("conform").formatters_by_ft[v.lang] = require("conform").formatters_by_ft[v.lang] or {}
        table.insert(require("conform").formatters_by_ft[v.lang], v.formatter)
      end
      vim.api.nvim_create_autocmd({ "BufWritePre" }, {
        pattern = "*",
        callback = function(args)
          require("conform").format({ bufnr = args.buf })
        end,
      })
    end,
  },
}
