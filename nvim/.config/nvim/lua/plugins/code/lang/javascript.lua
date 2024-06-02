return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "angular",
        "astro",
        "vue",
        "svelte",
        "javascript",
        "jsdoc",
        "typescript",
        "tsx",
        "wgsl", -- Webgl shader lang
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      vim.list_extend(opts.servers, {
        "angularls",
        "astro",
        "svelte",
        "tsserver",
        "biome",
        "wgsl_analyzer",
      })
    end,
  },
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters = opts.linters or {}
      local langs = { "javascript", "typescript" }
      local linters = { "biomejs" }
      for _, lang in ipairs(langs) do
        for _, linter in ipairs(linters) do
          table.insert(opts.linters, { lang = lang, linter = linter })
        end
      end
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters = opts.formatters or {}
      local lang = "javascript"
      local formatters = { "biome" }
      for _, formatter in ipairs(formatters) do
        table.insert(opts.formatters, { lang = lang, formatter = formatter })
      end
    end,
  },
}
