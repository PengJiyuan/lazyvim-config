-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map("n", "<D-s>", "<cmd>w<cr>", { desc = "Save File" })
map({ "i", "x", "n", "s" }, "<D-z>", "<cmd>undo<cr>", { desc = "Undo" })
map("n", "<D-Shift-z>", "<cmd>redo<cr>", { desc = "Redo" })
map("n", "<D-p>", LazyVim.pick("files"), { desc = "Find Files" })
map("n", "<D-Shift-p>", LazyVim.pick("commands"), { desc = "Command Palette" })
map("n", "<D-Shift-f>", LazyVim.pick("live_grep"), { desc = "Search in Files" })
map("n", "<leader>e", "<cmd>lua Snacks.explorer()<cr>", { desc = "Explorer" })
map("n", "<leader>/", LazyVim.pick("grep_word"), { desc = "Search Word Under Cursor" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
map("n", "gr", vim.lsp.buf.references, { desc = "References" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Symbol" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
map("n", "<leader>tt", "<cmd>terminal<cr>", { desc = "Terminal" })
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit Terminal Mode" })
