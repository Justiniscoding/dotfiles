-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>rn", ":IncRename ")

-- Runs the runProject command in a new terminal window
vim.keymap.set("n", "<leader>rp", function()
	vim.cmd("terminal zsh -ic 'runProject'")
end)

-- Redo with capital u instead of with Control + R
vim.keymap.set("n", "U", "<C-R>", { desc = "Redo last change" })

vim.keymap.set("i", "<C-h>", "<Left>")
vim.keymap.set("i", "<C-l>", "<Right>")
