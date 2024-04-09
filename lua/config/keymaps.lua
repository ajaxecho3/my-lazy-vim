-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional kaeymaps here
--
--
local map = vim.keymap.set

-- tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

--Windows management
map("n", "<leader>wv", "<C-w>v", { desc = "Split Vertically" })
map("n", "<leader>wh", "<C-w>s", { desc = "Split Horizontally" })
map("n", "<leader>we", "<C-w>=", { desc = "Equalize splits" })
map("n", "<leader>wx", "<cmd>close<CR>", { desc = "Close current split" })
map("n", "<leader>wo", "<cmd>only<CR>", { desc = "Close all splits except current" })
map("n", "<leader>wj", "<C-w>j", { desc = "Focus split below" })
map("n", "<leader>wk", "<C-w>k", { desc = "Focus split above" })
map("n", "<leader>wh", "<C-w>h", { desc = "Focus split left" })
map("n", "<leader>wl", "<C-w>l", { desc = "Focus split right" })
-- moving code blocks
map("n", "<C-k>", "mz:m-2<CR>`z", { desc = "Move line up" })
map("n", "<C-j>", "mz:m+<CR>`z", { desc = "Move line down" })

--multiple cursors
--#region<F3>
--#region<F6>
--testing
--#region1
--sdasdasd
