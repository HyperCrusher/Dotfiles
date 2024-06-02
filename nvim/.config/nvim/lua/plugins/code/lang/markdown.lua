return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "markdown_inline", "markdown" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      vim.list_extend(opts.servers, { "prosemd_lsp", "markdown_oxide" })
    end,
  },
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters = opts.linters or {}
      table.insert(opts.linters, { lang = "markdown", linter = "markdownlint" })
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters = opts.formatters or {}
      local lang = "markdown"
      local formatters = { "cbfmt" }
      for _, formatter in ipairs(formatters) do
        table.insert(opts.formatters, { lang = lang, formatter = formatter })
      end
    end,
  },
}
