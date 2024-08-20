-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set({ "n" }, "<leader>fdw", "<cmd>Telescope dir live_grep<cr>", { desc = "Search Word in Directory" })
vim.keymap.set({ "n" }, "<leader>fdf", "<cmd>Telescope dir live_grep<cr>", { desc = "Search File in Directory" })
vim.keymap.set({ "n" }, "<leader>n", "<cmd>nohlsearch<cr>", { desc = "Disable Highlighted Search" })
vim.keymap.set({ "n" }, "s", "<cmd>HopWord<cr>", { desc = "Disable Highlighted Search" })
