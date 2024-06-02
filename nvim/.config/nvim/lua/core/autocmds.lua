vim.cmd([[
  autocmd FileType markdown setlocal conceallevel=2
]])
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    vim.defer_fn(function()
      local api = require("nvim-tree.api")
      local view = require("nvim-tree.view")
      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        local name = vim.api.nvim_buf_get_name(buf)
        if name:match("NvimTree*") then
          if not view.is_visible() then
            api.tree.toggle({ focus = false, find_file = true })
          end
          break
        end
      end
    end, 1)
  end,
})
