return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "ocaml", "ocaml_interface", "ocamllex" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      vim.list_extend(opts.servers, { "ocamllsp" })
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters = opts.formatters or {}
      local lang = "ocaml"
      local formatters = { "ocamlformat", "ocp-indent" }
      for _, formatter in ipairs(formatters) do
        table.insert(opts.formatters, { lang = lang, formatter = formatter })
      end
    end,
  },
}
