local obsInit = function()
  local obsidian = require("obsidian")
  local toggle = require("markdown-toggle")
  local client = obsidian.Client
  local Self = obsidian.get_client()
  local inboxDir = "_Inbox"

  -- Make md only keymaps
  local keymap = function(mode, keys, action)
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "markdown",
      callback = function()
        vim.keymap.set(mode, keys, action, { silent = true, buffer = true })
      end,
    })
  end

  local cycle_checkbox = function()
    local line_num = unpack(vim.api.nvim_win_get_cursor(0))
    local line = vim.api.nvim_get_current_line()
    local checkbox_pattern = "^(%s*%- %[)([ x-])(%].*)$"
    local list_item_pattern = "^(%s*)([-+*]%s+)(.*)$"

    local checkbox_prefix, checkbox_state, checkbox_suffix = string.match(line, checkbox_pattern)
    if checkbox_prefix and checkbox_state and checkbox_suffix then
      local next_state = { [" "] = "-", ["-"] = "x", ["x"] = " " }
      print(next_state[checkbox_state])
      line = checkbox_prefix .. next_state[checkbox_state] .. checkbox_suffix
    else
      local indent, marker, text = string.match(line, list_item_pattern)
      if indent and marker then
        line = indent .. marker .. "[ ] " .. text
      else
        line = "- [ ] " .. line
      end
    end

    vim.api.nvim_buf_set_lines(0, line_num - 1, line_num, true, { line })
  end

  local function _createNewNote(name, dir, title)
    if name and name:find("/") then
      local path, filename = name:match("(.+)/(.+)")
      dir = dir or path
      name = filename
    end
    if name == nil then
      name = obsidian.util.zettel_id()
    end
    local fname = name:gsub("%s+", "-"):gsub("[^%w%-_%.]", "")

    if dir == nil then
      dir = inboxDir
    end
    if dir:sub(-1) ~= "/" then
      dir = dir .. "/"
    end
    os.execute('mkdir -p "' .. dir .. '"')
    local note = client.create_note(Self, {
      title = name,
      dir = dir,
      id = fname,
      no_write = true,
    })
    client.open_note(Self, note, { sync = true })
    note.id = obsidian.util.zettel_id()
    client.write_note_to_buffer(Self, note)
  end

  local function findNote()
    local Refs = require("obsidian.search").RefTypes
    local link, _, ref = obsidian.util.parse_cursor_link()
    if link ~= nil and ref ~= Refs.NakedUrl and ref ~= Refs.FileUrl then
      local path, file = string.match(link, "(.+)/(.+)");
      local candidate = client.resolve_note(Self, link)
      return {
        exist = candidate ~= nil,
        name = file or link,
        dir = path or "./",
        note = candidate
      }
    end
  end


  local function smartEnter()
    if obsidian.util.cursor_on_markdown_link() then
      local note = findNote()
      if note.exist then
        vim.cmd("ObsidianFollowLink")
      else
        _createNewNote(note.name, note.dir)
      end
      return
    end

    local currWord = vim.fn.expand("<cWORD>")
    if currWord:match("^#") then
      vim.cmd("ObsidianTags")
      return
    end
    cycle_checkbox()
  end

  local function _getVSelect()
    vim.cmd([[ execute "normal! \<ESC>" ]])
    local startPos = vim.fn.getpos("'<")
    local endPos = vim.fn.getpos("'>")

    if startPos[2] ~= endPos[2] then
      print("Only In-Line Selections Allowed")
      return
    end

    local line = vim.api.nvim_buf_get_lines(0, startPos[2] - 1, startPos[2], true)[1]

    local selection = string.sub(line, startPos[3], endPos[3])
    return { text = selection, startPos = startPos, endPos = endPos }
  end

  local function createNewNote()
    local name = vim.fn.input("Note name: ")
    vim.cmd("echo")
    if name == "" then
      name = nil
    end
    _createNewNote(name)
  end

  local function linkSelection()
    local bufdir = Self.buf_dir
    if bufdir == nil then
      return
    end

    local selection = _getVSelect()
    if selection == nil then
      return
    end
    client.resolve_link_async(Self, "[[" .. selection.text .. "]]", function(res)
      -- Replace selection with link
      vim.schedule(function()
        local _, startLine, startCol = unpack(selection.startPos)
        local _, endLine, endCol = unpack(selection.endPos)
        vim.api.nvim_buf_set_text(
          0,
          startLine - 1,
          startCol - 1,
          endLine - 1,
          endCol,
          { "[[" .. selection.text .. "]]" }
        )
      end)
      -- Make file if none exists
      if res.path == nil then
        vim.schedule(function()
          local dir = bufdir.filename
          _createNewNote(selection.text, dir, selection.text)
        end)
      end
    end)
  end


  keymap("n", "<Leader>nn", createNewNote)
  keymap("n", "<cr>", smartEnter)
  keymap("v", "<cr>", linkSelection)
  keymap("i", "<cr>", toggle.autolist_cr)
  keymap("n", "o", toggle.autolist_down)
  keymap("n", "O", toggle.autolist_up)
end

return {
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = false,
    dependencies = {
      "roodolv/markdown-toggle.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      mapmings = {},
      ui = {
        enable = true,
        checkboxes = {},
        bullets = {},
        reference_text = { hl_group = "markdownLinkText" }
      },
      follow_url_func = function(url) -- Go to file
        if string.sub(url, 1, 5) == "file:" then
          local hashIndex = url:find("#")
          if hashIndex then
            local filePath = string.sub(url, 6, hashIndex - 1)
            local lineNumber = tonumber(string.sub(url, hashIndex + 1))
            vim.cmd("e +" .. lineNumber .. " " .. filePath)
          else
            vim.cmd("e " .. string.sub(url, 6))
          end
        else
          vim.ui.open(url)
        end
      end,
      workspaces = {
        {
          name = "personal",
          path = "~/Documents/vaults/personal",
        },
        {
          name = "work",
          path = "~/Documents/vaults/work",
        },
        {
          name = "no-vault",
          path = function()
            return assert(vim.fs.dirname(vim.api.nvim_buf_get_name(0)))
          end,
          overrides = {
            notes_subdir = vim.NIL,
            new_notes_location = "current_dir",
            disable_frontmatter = true,
          },
        },
      },
    },
    init = obsInit,
  },
  {
    "jmbuhr/otter.nvim",
    dependencies = {
      { "nvim-treesitter/nvim-treesitter" }
    },
    opts = {
      buffers = {
        set_filetype = true
      }
    }
  },
  {
    "roodolv/markdown-toggle.nvim",
    opts = {
      enable_innder_indent = true,
      enable_blankhead_skip = true
    }
  },
  {
    "Kicamon/markdown-table-mode.nvim",
    config = function()
      require("markdown-table-mode").setup()
    end
  },
  {
    "vhyrro/luarocks.nvim",
    priority = 1001, -- this plugin needs to run before anything else
    opts = {
      rocks = { "magick" },
    },
  },
  {
    "3rd/image.nvim",
    dependencies = { "luarocks.nvim" },
    opts = {
      backend = "kitty",
      window_overlap_clear_enabled = true,
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          filertpes = { "markdown" }
        }
      }
    }
  }
}
