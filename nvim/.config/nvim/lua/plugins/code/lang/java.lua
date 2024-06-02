return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "java", "kotlin" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      vim.list_extend(opts.servers, { "java_language_server", "jdtls", "kotlin_language_server" })
    end,
  },
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters = opts.linters or {}
      table.insert(opts.linters, { lang = "java", linter = "checkstyle" })
      table.insert(opts.linters, { lang = "kotlin", linter = "ktlint" })
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters = opts.formatters or {}
      local lang = "java"
      local formatters = { "uncrustify", "google-java-format" }
      for _, formatter in ipairs(formatters) do
        table.insert(opts.formatters, { lang = lang, formatter = formatter })
      end
    end,
  },
}
