vim.g.mapleader = " "

vim.keymap.set("n", "<Leader>l", "<Cmd>Lazy<CR>")

vim.keymap.set("n", "<Leader> ", "<Cmd>Neotree toggle<CR>")

vim.keymap.set("n", "<Leader>tt", "<Cmd>Telescope<CR>")
vim.keymap.set("n", "<Leader>tf", "<Cmd>Telescope find_files<CR>")
vim.keymap.set("n", "<Leader>tg", "<Cmd>Telescope live_grep<CR>")
