return {
  -- UI Element alterations / Additions
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    init = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      vim.opt.termguicolors = true
      vim.cmd([[call timer_start(1000 * 5, {-> execute(':NvimTreeRefresh')}, {'repeat': -1})]])
    end,
    opts = {
      hijack_cursor = true,
      sync_root_with_cwd = true,
      reload_on_bufenter = true,
      select_prompts = true,
      update_focused_file = { enable = true },
      modified = { enable = true },
      diagnostics = {
        enable = true,
        severity = { min = vim.diagnostic.severity.WARN },
      },
      git = {
        show_on_dirs = false,
        show_on_open_dirs = false,
      },
      ui = { confirm = { default_yes = true } },
      view = { side = "right", width = {} },
      renderer = {
        add_trailing = true,
        root_folder_label = function()
          local cwd = vim.fn.getcwd()
          local pathComponents = {}
          for component in string.gmatch(cwd, "[^//]+") do
            table.insert(pathComponents, component)
          end
          if #pathComponents == 0 then
            return cwd
          end
          local parentDirName = pathComponents[#pathComponents]
          local capitalizedParentDirName = parentDirName:sub(1, 1):upper() .. parentDirName:sub(2)
          return capitalizedParentDirName
        end,
        indent_markers = { enable = true },
        icons = {
          web_devicons = { folder = { enable = true } },
          git_placement = "after",
          modified_placement = "signcolumn",
          glyphs = {
            git = {
              unstaged = "✗",
              staged = "",
              unmerged = "",
              renamed = "",
              untracked = "",
              deleted = "󰛲",
              ignored = "󰻃",
            },
            modified = "",
          },
          show = { diagnostics = false },
        },
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    config = true,
  },
  {
    "akinsho/bufferline.nvim",
    dependencies = {
      "catppuccin/nvim",
      "famiu/bufdelete.nvim",
    },
    opts = {
      highlights = require("catppuccin.groups.integrations.bufferline").get({
        custom = {
          all = {
            fill = { bg = require("catppuccin.palettes").get_palette("mocha").mantle },
          },
        },
      }),
      options = {
        show_buffer_close_icons = false,
        show_close_icon = false,
        move_wraps_at_end = false,
        offsets = {
          {
            filetype = "NvimTree",
            separator = "",
            text = "File Tree",
          },
        },
      },
    },
  },
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = true,
  },
  {
    "luukvbaal/statuscol.nvim",
    dependencies = { "lewis6991/gitsigns.nvim", "mfussenegger/nvim-dap" },
    config = function()
      local builtin = require("statuscol.builtin")
      require("statuscol").setup({
        ft_ignore = { "NvimTree", "toggleterm", "help", "quickfix", "preview" },
        segments = {
          { sign = { namespace = { "gitsign*" } }, click = "v:lua.ScSa" },
          { sign = { name = { ".*" } } },
          { text = { builtin.lnumfunc, " " }, condition = { true, builtin.not_empty }, click = "v:lua.ScLa" },
          { text = { builtin.foldfunc, "  " }, click = "v:lua.ScFa" },
        },
      })
    end,
  },
  {
    "mawkler/modicator.nvim",
    opts = {
      highlights = { defaults = { bold = true, italic = false } },
      integration = { lualine = { enabled = false } },
    },
  },
  {
    "stevearc/dressing.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "ziontee113/icon-picker.nvim" },
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    main = "ufo",
    init = function()
      local options = vim.opt
      options.foldcolumn = "1"
      options.foldlevel = 99
      options.foldlevelstart = 99
      options.foldenable = true
    end,
    opts = {
      provider_selector = function()
        return ""
      end,
    },
  },
  -- Editor Alterations
  { "HiPhish/rainbow-delimiters.nvim" },
  {
    "lukas-reineke/indent-blankline.nvim",
    dependencies = "catppuccin/nvim",
    config = function()
      require("ibl").setup({
        scope = {
          show_start = false,
          include = {
            node_type = { lua = { "return_statement", "table_constructor" } },
          },
        },
      })
    end,
  },
  { "RRethy/vim-illuminate" },
  {
    "brenoprata10/nvim-highlight-colors",
    opts = { enable_named_colors = false, enable_tailwind = true },
    config = true,
  },
  {
    "nvimdev/hlsearch.nvim",
    event = "BufRead",
    config = true,
  },
  {
    "kevinhwang91/nvim-hlslens",
    main = "hlslens",
    init = function()
      local kopts = { noremap = true, silent = true }
      vim.api.nvim_set_keymap(
        "n",
        "n",
        [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
        kopts
      )
      vim.api.nvim_set_keymap(
        "n",
        "N",
        [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
        kopts
      )
      vim.api.nvim_set_keymap("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap("n", "<Leader>l", "<Cmd>noh<CR>", kopts)
    end,
    config = true,
  },
}
