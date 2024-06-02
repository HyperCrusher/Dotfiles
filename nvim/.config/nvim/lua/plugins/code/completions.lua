local cmp_kinds = {
  Text = "󰉿 ",
  Method = "  ",
  Function = "  ",
  Constructor = "  ",
  Field = "  ",
  Variable = "  ",
  Class = "  ",
  Interface = "  ",
  Module = "  ",
  Property = "  ",
  Unit = "  ",
  Value = "󰎠 ",
  Enum = "  ",
  Keyword = "  ",
  Snippet = " ",
  Color = "  ",
  File = "  ",
  Reference = "  ",
  Folder = "  ",
  EnumMember = "  ",
  Constant = "  ",
  Struct = "  ",
  Event = "  ",
  Operator = "  ",
  TypeParameter = "  ",
}

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lua",
      "lukas-reineke/cmp-under-comparator",
      "ray-x/cmp-treesitter",
      "hrsh7th/cmp-emoji",
      "https://codeberg.org/FelipeLema/cmp-async-path",
      "kdheepak/cmp-latex-symbols",
      {
        "saadparwaiz1/cmp_luasnip",
        dependencies = {
          {
            "L3MON4D3/LuaSnip",
            init = function()
              require("luasnip.loaders.from_vscode").lazy_load()
            end,
            dependencies = { "rafamadriz/friendly-snippets" },
          },
        },
      },
    },
    lazy = false,
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        enabled = function()
          local context = require("cmp.config.context")
          if vim.api.nvim_get_mode().mode == "c" then
            return true
          else
            return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
          end
        end,
        window = {
          completion = {
            border = "rounded",
          },
          documentation = {
            border = "rounded",
          },
        },
        formatting = {
          fields = {
            "kind",
            "abbr",
            "menu",
          },
          expandable_indicator = false,
          format = function(_, vim_item)
            local icon = cmp_kinds[vim_item.kind]
            local kind = vim_item.kind
            vim_item.kind = icon
            if not (kind == "Text") then
              vim_item.menu = " (" .. kind .. ") "
            end
            return vim_item
          end,
        },
        matching = {
          disallow_prefix_unmatching = true,
        },
        performance = {
          max_view_entries = 12,
        },
        sorting = {
          priority_weight = 2,
          comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            cmp.config.compare.locality,
            require("cmp-under-comparator").under,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.order,
          },
        },
        completion = {
          completeopt = "menu,menuone,noinset",
        },
        view = {
          docs = {
            auto_open = false,
          },
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<cr>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.confirm({ select = true })
            elseif luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end),
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
          ["<S-Tab>"] = function(fallback)
            if cmp.visible() then
              cmp.abort()
            else
              fallback()
            end
          end,
        }),
        sources = cmp.config.sources({
          { name = "luasnip" },
          { name = "nvim_lsp" },
          { name = "emoji" },
          { name = "latex_symbols" },
          { name = "async_path" },
        }),
        -- Cmp Commandline Completions
        cmp.setup.cmdline(":", {
          mapping = cmp.mapping.preset.cmdline({
            ["<Tab>"] = cmp.mapping.confirm({ select = true }),
          }),
          sources = cmp.config.sources({
            { name = "async_path" },
          }, {
            {
              name = "cmdline",
              option = {
                ignore_cmds = { "Man", "!" },
              },
            },
          }),
        }),
        -- Search autocomplete based on curr buffer
        cmp.setup.cmdline("/", {
          mapping = cmp.mapping.preset.cmdline(),
          sources = {
            { name = "buffer" },
          },
        }),
      })
    end,
  },
}
