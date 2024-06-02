return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "json", "json5", "yaml", "toml", "ini" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      vim.list_extend(opts.servers, { "jsonls", "taplo", "yamlls" })
    end,
  },
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters = opts.linters or {}
      table.insert(opts.linters, { lang = "json", linter = "jsonlint" })
      table.insert(opts.linters, { lang = "yaml", linter = "yamllint" })
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters = opts.formatters or {}
      local lang = "json"
      local formatters = { "fixjson" }
      for _, formatter in ipairs(formatters) do
        table.insert(opts.formatters, { lang = lang, formatter = formatter })
      end
      lang = "yaml"
      formatters = { "yq", "yamlfix" }
      for _, formatter in ipairs(formatters) do
        table.insert(opts.formatters, { lang = lang, formatter = formatter })
      end
    end,
  },
}
