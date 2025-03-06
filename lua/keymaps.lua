vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local map = vim.keymap.set

map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
map("n", "<leader>f", "<cmd>lua Snacks.picker('files')<cr>", { desc = "Files" })

-- TODO: Works on neovide, but not ghostty
map("v", "<c-s-c>", '"+y', { desc = "Copy to system clipboard" })
map("n", "<c-s-v>", '"+p', { desc = "Paste from system clipboard" })
map("i", "<c-s-v>", '<esc>"+pa', { desc = "Paste from system clipboard" })

map("n", "<tab>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<s-tab>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })

map("n", "<c-h>", "<c-w>h", { desc = "Go to left window" })
map("n", "<c-j>", "<c-w>j", { desc = "Go to lower window" })
map("n", "<c-k>", "<c-w>k", { desc = "Go to upper window" })
map("n", "<c-l>", "<c-w>l", { desc = "Go to right window" })

map("n", "<leader>-", "<c-w>s", { desc = "Horizontal split" })
map("n", "<leader>|", "<c-w>v", { desc = "Vertical split" })
