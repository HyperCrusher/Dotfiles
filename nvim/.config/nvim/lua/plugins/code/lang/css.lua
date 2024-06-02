return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "css", "scss", "styled" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      vim.list_extend(opts.servers, { "cssls", "cssmodules_ls", "somesass_ls", "stylelint_lsp" })
    end,
  },
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters = opts.linters or {}
      local langs = { "scss", "css", "sass" }
      local linters = { "stylelint" }
      for _, lang in ipairs(langs) do
        for _, linter in ipairs(linters) do
          table.insert(opts.linters, { lang = lang, linter = linter })
        end
      end
    end,
  },
}
