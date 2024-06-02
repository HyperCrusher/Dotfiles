-- Keymap Config (non-plugin)
local keymap = function(mode, keys, action)
  vim.keymap.set(mode, keys, action, { silent = true })
end

-- Leader Key
----------------------------------------------------------
vim.g.mapleader = " "
keymap("", "<Space>", "<Nop>")

-- Normal Mode
-----------------------------------------------------------------

-- Alt + movement for window resizing
keymap("n", "<M-k>", ":resize -2<CR>")
keymap("n", "<M-j>", ":resize +2<CR>")
keymap("n", "<M-l>", ":vertical resize +2<CR>")
keymap("n", "<M-h>", ":vertical resize -2<CR>")

-- Ctrl + Movement for window navigation
keymap("n", "<C-k>", ":NvimTmuxNavigateUp<CR>")
keymap("n", "<C-j>", ":NvimTmuxNavigateDown<CR>")
keymap("n", "<C-l>", ":NvimTmuxNavigateRight<CR>")
keymap("n", "<C-h>", ":NvimTmuxNavigateLeft<CR>")
keymap("n", "<Leader>t", ":TroubleToggle<CR><CR>")

-- Close the current window
keymap("n", "<Leader>c", ":close<CR>")

-- Ctrl + S to save
keymap("n", "<C-s>", ":w<CR>")

-- Center the screen on movement
keymap("n", "j", "jzz")
keymap("n", "k", "kzz")
keymap("n", "n", "nzz")
keymap("n", "N", "Nzz")
keymap("n", "<C-o>", "<C-o>zz")
keymap("n", "<C-i>", "<C-i>zz")

-- Shift + movement for buffer navigation
-- Plugin: barbar.nvim
keymap("n", "<S-l>", ":BufferLineCycleNext<CR>")
keymap("n", "<S-h>", ":BufferLineCyclePrev<CR>")
keymap("n", "<S-x>", ":Bdelete<CR>")

-- File Tree
-- Plugin: Nvim-Tree
keymap("n", "<C-b>", ":NvimTreeToggle<cr>")

-- File Explorer
-- Plugin: oil.nvim
keymap("n", "<leader><leader>", ":Oil --float<cr>")

-- Lazygit
-- Plugin: lazygit.nvim
keymap("n", "<leader>g", ":LazyGit<cr>")

-- Telescope
-- Plugin: telescope
keymap("n", "<leader>s", ":Telescope live_grep<cr>")
keymap("n", "<leader>ff", ":Telescope find_files<cr>")

-- Screenshot
-- Plugin: codesnap.nvim
keymap("v", "<leader>ps", ":'<,'>CodeSnap<cr>")

-- Toggle Fold
-- Plugin: fold-cycle.nvim
keymap("n", "<tab>", ':lua require("fold-cycle").open()<cr>')

-- Harpoon
-- Plugin: harpoon
keymap("n", "<C-a>", ":lua require('harpoon'):list():add()<cr>")
keymap("n", "<C-e>", ":lua require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())<cr>")
keymap("n", "<C-S-p>", ":lua require('harpoon'):list():prev()<cr>")
keymap("n", "<C-S-n>", ":lua require('harpoon'):list():next()<cr>")

-- Visual Mode
-----------------------------------------------------------------

-- Search for selected text when pressing /
keymap("v", "/", '"fy/\\V<C-R>f<CR>N')

-- Preserve selection while indenting
keymap("v", ">", ">gv")
keymap("v", "<", "<gv")

-- Indent with Tab key
keymap("v", "<TAB>", ">gv")
keymap("v", "<S-TAB>", "<gv")

-- Paste without overriding clipboard
keymap("v", "p", '"_dP')
