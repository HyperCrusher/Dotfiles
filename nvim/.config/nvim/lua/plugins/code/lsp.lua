-- All onAttach functions should be linked in here
local function globalOnAttach(client, buffer)
  local keymap = function(mode, keys, action, opt)
    local default_opts = { silent = true, buffer = true }
    opt = opt or {}
    for k, v in pairs(default_opts) do
      if opt[k] == nil then
        opt[k] = v
      end
    end
    vim.keymap.set(mode, keys, action, opt)
  end

  require("lsp_signature").on_attach({}, buffer)
  require("workspace-diagnostics").populate_workspace_diagnostics(client, buffer)

  keymap("n", "K", vim.lsp.buf.hover)
  keymap("n", "R", function()
    return ":IncRename " .. vim.fn.expand("<cword>")
  end, { expr = true })

  keymap("n", "gd", ":Telescope lsp_definitions initial_mode=normal<CR>")
  keymap("n", "gi", ":Telescope lsp_implementations initial_mode=normal<CR>")
  keymap("n", "gt", ":Telescope lsp_type_definitions initial_mode=normal<CR>")
  keymap("n", "gD", vim.lsp.buf.declaration)
  keymap("n", "gr", ":Telescope lsp_references initial_mode=normal<CR>")

  keymap("n", "gf", require("actions-preview").code_actions)
end
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "ray-x/lsp_signature.nvim", config = true },
      { "ray-x/lsp_signature.nvim", config = true },
      { "williamboman/mason.nvim", config = true },
      { "williamboman/mason-lspconfig.nvim", config = true },
      { "artemave/workspace-diagnostics.nvim", config = true },
      { "VidocqH/lsp-lens.nvim", config = true },
      { "aznhe21/actions-preview.nvim", config = true },
      { "folke/trouble.nvim", config = true },
      { "folke/neodev.nvim", config = true },
      {
        "j-hui/fidget.nvim",
        opts = {
          notification = {
            window = {
              winblend = 0,
            },
          },
        },
      },
    },
    opts = {
      diagnostics = {
        update_in_insert = true,
      },
      servers = {},
    },
    config = function(_, opts)
      if type(opts.servers) == "table" then
        local added = {}
        opts.servers = vim.tbl_filter(function(server)
          if added[server] then
            return false
          end
          added[server] = true
          return true
        end, opts.servers)
      end
      require("mason").setup()
      require("mason-lspconfig").setup({
        automatic_installation = true,
      })
      local lspconfig = require("lspconfig")
      for _, v in pairs(opts.servers) do
        lspconfig[v].setup({
          capabilities = require("cmp_nvim_lsp").default_capabilities(),
          on_attach = globalOnAttach,
        })
      end
      vim.diagnostic.config(opts.diagnostics or {})
    end,
  },
}
