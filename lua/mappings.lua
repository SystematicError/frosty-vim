local keymap = vim.keymap

vim.g.mapleader = " "

keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

keymap.set("n", "<Leader>l", "<Cmd>Lazy<CR>")

keymap.set("n", "<Leader> ", "<Cmd>Neotree toggle<CR>")

keymap.set("n", "<Leader>tt", "<Cmd>Telescope<CR>")
keymap.set("n", "<Leader>tf", "<Cmd>Telescope find_files<CR>")
keymap.set("n", "<Leader>tg", "<Cmd>Telescope live_grep<CR>")
