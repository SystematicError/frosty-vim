vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local map = vim.keymap.set

map("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })

map("n", "<leader>n", "<cmd>ene<cr>", { desc = "New file" })
map({ "n", "i", "x", "s" }, "<c-s>", "<cmd>w<cr>", { desc = "Save file" })

map("n", "<esc>", "<cmd>noh<cr>", { desc = "Clear search highlights" })

map("n", "<c-s-c>", 'V"+y', { desc = "Copy to system clipboard" })
map("v", "<c-s-c>", '"+ygv', { desc = "Copy to system clipboard" })
map("n", "<c-s-v>", '"+p', { desc = "Paste from system clipboard" })
map("i", "<c-s-v>", '<esc>"+pa', { desc = "Paste from system clipboard" })

map("v", ">", ">gv", { desc = "Indent" })
map("v", "<", "<gv", { desc = "Unindent" })

map("n", "<a-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move line down" })
map("n", "<a-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move line up" })
map("i", "<a-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move line down" })
map("i", "<a-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move line up" })
map("v", "<a-j>", ":<c-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move selection down" })
map("v", "<a-k>", ":<c-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move selection up" })

map("n", "<leader>-", "<c-w>s", { desc = "Horizontal split" })
map("n", "<leader>|", "<c-w>v", { desc = "Vertical split" })

map("n", "<c-h>", "<c-w>h", { desc = "Go to left window" })
map("n", "<c-j>", "<c-w>j", { desc = "Go to lower window" })
map("n", "<c-k>", "<c-w>k", { desc = "Go to upper window" })
map("n", "<c-l>", "<c-w>l", { desc = "Go to right window" })

map("n", "<c-up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<c-down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<c-left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<c-right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

map("n", "<tab>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<s-tab>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
map("n", "<leader>bl", "<cmd>e #<cr>", { desc = "Last buffer" })
map("n", "<leader>x", "<cmd>bd<cr>", { desc = "Delete buffer" })
map("n", "<leader>bx", "<cmd>bd<cr>", { desc = "Delete buffer" })
