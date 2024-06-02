return {
  {
    "ethanholz/nvim-lastplace",
    opts = {
      lastplace_ignore_buftype = {
        "quickfix",
        "nofile",
        "help",
      },
      lastplace_ignore_filetype = {
        "gitcommit",
        "gitrebase",
        "harpoon",
      },
      lastplace_open_folds = true,
    },
  },
  {
    "ThePrimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    branch = "harpoon2",
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()
      -- Keybinds when within harpoon
      harpoon:extend({
        UI_CREATE = function(cx)
          local refresh_list = function()
            local len = harpoon:list():length()
            if len > 0 then
              local newList = {}
              for i = 1, len, 1 do
                local item = harpoon:list():get(i)
                if item ~= nil then
                  table.insert(newList, item)
                end
              end
              harpoon:list():clear()
              for _, item in ipairs(newList) do
                harpoon:list():add(item)
              end
            end
          end
          -- Open in vsplit
          vim.keymap.set("n", "<C-v>", function()
            harpoon.ui:select_menu_item({ vsplit = true })
          end, { buffer = cx.bufnr })
          -- Clear
          vim.keymap.set("n", "<C-c>", function()
            harpoon:list():clear()
            harpoon.ui:close_menu()
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end, { buffer = cx.bufnr })
          -- Delete curr idx
          vim.keymap.set("n", "d", function()
            local idx = vim.fn.line(".")
            harpoon:list():remove_at(idx)
            refresh_list()
            harpoon.ui:close_menu()
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end, { buffer = cx.bufnr })
          vim.keymap.set("n", "h", function()
            local idx = vim.fn.line(".")
            print(harpoon:list():get(idx))
          end, { buffer = cx.bufnr })
        end,
      })
    end,
  },
  { "mateuszwieloch/automkdir.nvim" },
  {
    "smjonas/inc-rename.nvim",
    dependencies = {
      "stevearc/dressing.nvim",
    },
    opts = {
      input_buffer_type = "dressing",
    },
    config = true,
  },
  {
    "jghauser/fold-cycle.nvim",
    config = true,
  },
  {
    "chrisgrieser/nvim-recorder",
    opts = {
      slots = { "a", "b", "c", "d", "e", "f" },
      mapping = {
        startStopRecording = "q",
        playMacro = "Q",
        switchSlot = "<C-q>",
        editMacro = "eq",
        yankMacro = "yq",
      },
      clear = true,
    },
  },
  {
    "willothy/moveline.nvim",
    build = "make",
    lazy = false,
    config = function()
      local keymap = function(mode, keys, action)
        vim.keymap.set(mode, keys, action, { silent = true })
      end
      keymap("v", "<C-k>", require("moveline").block_up)
      keymap("v", "<C-j>", require("moveline").block_down)
    end,
  },
  {
    "alexghergh/nvim-tmux-navigation",
    config = true,
  },
  {
    "rmagatti/auto-session",
    config = true,
  },
  {
    "mistricky/codesnap.nvim",
    build = "make",
    opts = {
      has_breadcrumbs = true,
      bg_theme = "grape",
      watermark = "",
      mac_window_bar = false,
      code_font_family = "Jetbrains Mono",
    },
  },
}
