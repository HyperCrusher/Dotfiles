return {
  {
    "AckslD/swenv.nvim",
    config = true,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "python" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      vim.list_extend(opts.servers, { "basedpyright", "pylsp" })
    end,
  },
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters = opts.linters or {}
      local langs = { "c", "cpp" }
      local linters = { "clang-tidy", "cppcheck", "cpplint" }
      for _, lang in ipairs(langs) do
        for _, linter in ipairs(linters) do
          table.insert(opts.linters, { lang = lang, linter = linter })
        end
      end
      table.insert(opts.linters, { lang = "make", linter = "checkmake" })
      table.insert(opts.linters, { lang = "cmake", linter = "cmakelint" })
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters = opts.formatters or {}
      local lang = "python"
      local formatters = { "isort", "ruff_format", "black" }
      for _, formatter in ipairs(formatters) do
        table.insert(opts.formatters, { lang = lang, formatter = formatter })
      end
    end,
  },
}
