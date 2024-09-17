-- Telescope
setKeymap("n", "<leader><leader>", ":Yazi<cr>")
setKeymap("n", "<leader>ff", ":Telescope find_files<cr>")
setKeymap("n", "<leader>s", ":Telescope live_grep<cr>")

-- Toggle Folds
preq("fold-cycle", function(fold) setKeymap("n", "<tab>", fold.open) end)

-- Harpoon
preq("harpoon", function(harpoon)
    setKeymap("n", "<leader>h",
              function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
    setKeymap("n", "<leader>ha", function() harpoon.list():add() end)
    setKeymap("n", "<C-S-N>", function() harpoon:list():next() end)
    setKeymap("n", "<C-S-P>", function() harpoon:list():prev() end)
end)

-- Trouble
setKeymap("n", "<leader>t", ":Trouble diagnostics toggle<cr>")

-- Lazygit
setKeymap("n", "<leader>g", ":LazyGit<cr>")

-- Obsidian tools
setKeymap("n", "oy", ":let @+ = 'file:'..expand('%:p')..'#'..line('.')<cr>")
setKeymap("n", "op", "i[[<esc>pa|]]<esc>hha")
